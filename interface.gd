extends Node
## if Interface.node_implements_interface(object, Interface.ExampleInterface)

class InteractableInterface:
	signal interacted
	func interact():
		pass


## Takes node & interface. Returns true if node implements
## given interface. Returns false if not.
func node_implements_interface(node_to_check: Node, interface) -> bool:
	# If node has an 'implements' variable
	if "implements" in node_to_check:
		var node_implements = node_to_check.implements
		
		# If the node implements one interface, check it:
		if not node_implements is Array:
			if node_implements == interface:
				return true
		# If the node implements multiple interfaces, check all:
		else:
			for i in node_implements:
				if i == interface:
					return true
	return false

## Returns array of all descendants of given node + given node
func _get_all_descendants(node: Node) -> Array:
	var all_descendants = [node]
	
	# Recursively check for descendants
	for child in node.get_children():
		all_descendants.append_array(_get_all_descendants(child))
	return all_descendants

## Checks the node's methods, properties & signals to see if they match
## interface's methods, properties & signals. Throws error if not
func _check_node(node: Node) -> void:
	if "implements" in node:
		var node_implements = node.implements
		
		var check = func (node, interface_instance):
			var error_string:String = "Interface error: " + node.name + " does not possess the "
			
			## Assert will throw error if false, and send argument 2 as the Error message
			for method in interface_instance.get_script().get_script_method_list():
				assert(method.name in node, error_string + method.name + " method.")
			for this_signal in interface_instance.get_script().get_script_method_list():
				assert(this_signal.name in node, error_string + this_signal.name + " signal.")
			var prop_list:Array = interface_instance.get_script().get_script_property_list()
			for i in range(1, prop_list.size()): # skip first property as default is prop "Built-in script"
				var property = prop_list[i]
				assert(property.name in node, error_string + property.name + " property.")
		
		# Run check on all implements if multiple
		if node_implements is Array:
			for implemented_interface in node_implements:
				var instance = implemented_interface.new()
				check.call(node, instance)
		# Run check on the implements if single
		else:
			var instance = node.implements.new()
			check.call(node, instance)
