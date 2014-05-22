// each item should look like this:
// <li>
//     <input type="checkbox" /> 
//     <span>Broccoli</span>
// </li> 
//functions
var strikeItem = function() {
	var cbId = this.id.replace("cb_",""); //whoever called strikeItem 
	var itemText = document.getElementById("item_"+cbId);

	if (this.checked) {
		itemText.style.textDecoration = "line-through";
	} else {
		itemText.style.textDecoration = "none";
	}
}

var addNewItem = function(list, itemName) {
	totalItems++;

	var listItem = document.createElement("li");

	var checkbox = document.createElement("input");
	checkbox.type = "checkbox";
	checkbox.id = "cb_" + totalItems;
	checkbox.onclick = strikeItem;
    
	var span = document.createElement("span");
	span.id = "item_" + totalItems;
	span.innerText = itemName;

    listItem.appendChild(checkbox);
    listItem.appendChild(span);

	list.appendChild(listItem);

}




//calling
var totalItems = 0;
var itemForm = document.getElementById("itemForm");
itemForm.focus();

var btnNew = document.getElementById("addButton");
btnNew.onclick = function(){
	var itemName = itemForm.value;
	if (!itemName || itemName === '') {
		return false; //stop here
	}
	addNewItem(document.getElementById("listSheet"),itemName);
	itemForm.select();
};






















