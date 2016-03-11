<%@page import="com.camriders.domains.Tag"%>

<g:field type="text" name="tags"></g:field>


<script>
  $(function() {
    var availableTags = [
<g:each in="${Tag.list()}" var="tag" status="i">
"${tag?.title}"<g:if test="${(i < Tag.count) }">,</g:if>	
</g:each> 	
    ];
    $( "#tags" ).autocomplete({
      source: availableTags
    });
  });
  $('#tags').bind('keydown', function (e) {
     var key = e.keyCode;
      if (key === 13) {
    	  e.preventDefault();
    	               addTag(this.value);
          }
     
  });   
 function addTag(title){

	  if(!document.getElementById('tag_'+title)){
	  var tagger= document.getElementById('tags').parentNode;
	  var tag = document.createElement('a');
	  var vrbl = document.createElement('input');
	  tag.setAttribute('href','#');
	  vrbl.setAttribute('type','hidden');
	  
	  tag.setAttribute('class','round label');
	  vrbl.setAttribute('id','tag');
	  vrbl.setAttribute('name','tag');
	  tag.setAttribute('id','tag_'+title);
	  tag.setAttribute('onclick','deleteTag("tag_'+title+'")');
	  vrbl.setAttribute('value',title);
	  tag.innerHTML=title;
	 
	  tagger.appendChild(tag);
	  tagger.appendChild(vrbl);
  }
	  }
 function deleteTag(id){
	 var tag = document.getElementById(id);
	 tag.parentNode.removeChild(tag);
	 var  vrbl;
	 var vrbls = document.getElementsByName('tag');
	 for(i = 0; i < vrbls.length; i++){
		
					if(vrbls[i].value==id.substring(4)){
				vrbl=vrbls[i];
				}
		 }
	 vrbl.parentNode.removeChild(vrbl);
	 
	 }
  
</script>