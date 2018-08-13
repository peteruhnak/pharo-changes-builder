tests
testBuildSetter
	builder selector: #item:.
	builder arguments: { 'Item' }.
	builder addComment: 'hello'.
	builder addPragma: (Pragma keyword: #generated arguments: {}).
	self
		assertMethod: builder buildSetter
		equals:
			'item: anItem
	"hello"
	<generated>
	item := anItem'