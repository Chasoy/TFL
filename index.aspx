<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jubb!</title>

<style>
body{
font-family:Arial;
text-align:center;
margin-top:40px;
}

table{
margin:auto;
border-collapse:collapse;
}

td,th{
border:1px solid #ccc;
padding:10px 20px;
}
</style>

</head>
<body>

<h1>Jubb</h1>

<table id="table">
<tr>
<th>Uppgift</th>
<th>TFL</th>
</tr>
</table>

<script>

const users = ["Jonatan","Jonas","Michaela"];
const tasks = ["Change","Incident","Övrigt"];

// get day number since epoch
function getDayNumber(){
    return Math.floor(Date.now() / 86400000);
}

function generateAssignments(){

    const day = getDayNumber();

    let assignments = {};

    for(let i=0;i<tasks.length;i++){

        const userIndex = (i + day) % users.length;

        assignments[tasks[i]] = users[userIndex];
    }

    return assignments;
}

function render(){

    const assignments = generateAssignments();
    const table = document.getElementById("table");

    for(const task in assignments){

        const row=document.createElement("tr");

        row.innerHTML=`
        <td>${task}</td>
        <td>${assignments[task]}</td>
        `;

        table.appendChild(row);
    }

}

render();

</script>

</body>
</html>