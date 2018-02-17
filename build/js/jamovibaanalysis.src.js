
// This file is an automatically generated and should not be edited

'use strict';

const options = [{"name":"data","type":"Data"},{"name":"method1","title":"Method 1","type":"Variable"},{"name":"method2","title":"Method 2","type":"Variable"},{"name":"ciDisplay","title":"Display confidence intervals","type":"Bool","default":true},{"name":"ciShading","title":"Display confidence interval shadings","type":"Bool","default":true}];

const view = View.extend({
    jus: "2.0",

    events: [

	]

});

view.layout = ui.extend({

    label: "Bland-Altman analysis",
    jus: "2.0",
    type: "root",
    stage: 0, //0 - release, 1 - development, 2 - proposed
    controls: [
		{
			type: DefaultControls.VariableSupplier,
			persistentItems: false,
			stretchFactor: 1,
			controls: [
				{
					type: DefaultControls.TargetLayoutBox,
					label: "Method 1",
					controls: [
						{
							type: DefaultControls.VariablesListBox,
							name: "method1",
							maxItemCount: 1,
							isTarget: true
						}
					]
				},
				{
					type: DefaultControls.TargetLayoutBox,
					label: "Method 2",
					controls: [
						{
							type: DefaultControls.VariablesListBox,
							name: "method2",
							maxItemCount: 1,
							isTarget: true
						}
					]
				}
			]
		},
		{
			type: DefaultControls.LayoutBox,
			margin: "large",
			controls: [
				{
					type: DefaultControls.CheckBox,
					name: "ciDisplay"
				},
				{
					type: DefaultControls.CheckBox,
					name: "ciShading"
				}
			]
		}
	]
});

module.exports = { view : view, options: options };
