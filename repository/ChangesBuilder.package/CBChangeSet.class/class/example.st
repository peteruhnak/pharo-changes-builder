example
example
| cls getter setter init changeSet |
cls := CBClass new.
cls name: 'Square'.
"package name, default 'Unclassified'"
cls package: 'Geometric-Shapes'.
"the superclass of Square, default is Object"
cls parent: 'Object'.

"add an instance variable"
cls addInstVarNamed: 'size'.

"getter: is a convenience method that will generate a basic accessor in 'accessing' protocl"
getter := CBMethod new
	getter: 'size'.
"dtto for setter"
setter := CBMethod new
	setter: 'size' argument: 'Number' comment: 'specify a new size'.
"'hand'-written source is also possible"
init := CBMethod new
	source: 'initialize
	size := 0';
	protocol: 'initialization'.

cls addMethod: getter.
cls addMethod: setter.
cls addMethod: init.

changeSet := CBChangeSet new.
changeSet addClass: cls.

"ChangesBrowser can also be used, but it throws error on empty changeset"
^ (CBChangesBrowser changes: changeSet refactoringChanges) open.