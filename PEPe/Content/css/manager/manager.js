$(document).ready(function(){

	function disableActions() {
		$('#actions a.disabled').unbind('click').click(function(){
			return false;
		});
	}
	
	$("table.adminlist a.delete").click(function(){
		var answer = confirm("Tem certeza que deseja excluir este registro?")
			if (!answer){
				return false
			}
	});
	
});