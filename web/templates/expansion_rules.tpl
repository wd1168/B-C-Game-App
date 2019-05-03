<html>
<head>
{include "head.tpl"}
<style>
.sidebar {
  border-radius: 25px;
  border: 2px solid rgb(91, 136, 216);
  background-color: white;
  padding: 30px;
  margin: 20px;
}
</style>
</head>
<body>
<div class="nav">

<div><a href="./index.php"><img src="./images/GrLogo.svg" alt="" style="margin-top: .25em;" width="30" height="30"></a></div>
<div style="padding-top: .45em"><a href="./board_games.php"><strong>Board</strong></a></div>
<div style="padding-top: .45em"><a href="./card_games.php"><strong>Card</strong></a></div>
<div style="padding-top: .45em;"><a href="./about.php"><strong>About</strong></a></div>
{if isset($first_name)}
    <div style="padding-top: .45em;"><strong> Hello {$first_name} {$last_name}!</strong></div>
    <!--Logout Button--><div style="padding-top: .45em"><a href ="./logout.php"><strong>Logout</strong></a></div>

{else}
    <div style="padding-top: .45em;"><a href="./login.php"><i class="fas fa-sign-in-alt" style="padding-top: .275em;"></i></a></div>
{/if}

</div>

<div class="container">
    <div class="content">
        <div class="jumbotron col-md-12 col-lg-12"><center><p><b>How to play: </b></p><h1> {$info[0]} </h1></center></div>
        <div  class="text-center" style="width: 30em ;margin-left: auto; margin-right: auto; margin-bottom: 2em;">
            <a href="./game.php?link={$info[1]}"><button class="btn btn-outline-primary btn-lg">Back to Overview</button></a>
        </div>
        <div class="input-group"  style="width: 30em ;margin-left: auto; margin-right: auto; margin-bottom: 2em;">
            <input type="text" id="myInput" class="form-control" onkeyup="myFunction(); isEmpty()" placeholder="Search the rules of this game" aria-label="Search Games" aria-describedby="basic-addon2" style="padding-top: .275em;">
        </div>

        <ul id="myUL">
            {for $x = 0 to sizeof($r_results)}
                <li ><a style="color:blue;" href="./expansion_rules.php?link={$category[$x]}"> <b> Category: </b>{$category[$x]}</a>
                    <a  style="color:blue;" href="./expansion_rules.php?link={$subcategory[$x]}"><b> Sub Category: </b>{$subcategory[$x]}</a>
                    <a  style="color:blue;" href="./expansion_rules.php?link={$rules[$x]}"><b> Rule: </b>{$rules[$x]}</a></li>
            {/for}
        </ul>

        <script>
            function myFunction() {
                var input, filter, ul, li, a,a1,a2, i, txtValue, txtValue1, txtValue2;
                input = document.getElementById("myInput");
                filter = input.value.toUpperCase();
                ul = document.getElementById("myUL");
                li = ul.getElementsByTagName("li");
                for (i = 0; i < li.length; i++) {
                    a = li[i].getElementsByTagName("a")[0];
                    a1 = li[i].getElementsByTagName("a")[1];
                    a2 = li[i].getElementsByTagName("a")[2];
                    txtValue = a.textContent || a.innerText;
                    txtValue1 = a1.textContent || a1.innerText;
                    txtValue2 = a2.textContent || a2.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1 ||
                        txtValue1.toUpperCase().indexOf(filter) > -1 ||
                        txtValue2.toUpperCase().indexOf(filter) > -1) {
                        li[i].style.display = "";
                    } else {
                        li[i].style.display = "none";
                    }
                }
            }
            function isEmpty() {
                if (document.getElementById("myInput").value == "") {
                    document.getElementById("myUL").style.display = "none";
                } else {
                    document.getElementById("myUL").style.display = "block";
                }
            }
        </script>
        <div class="row">
            <div class="col-md-4 col-lg-3">
              <div class="sidebar">
                <p><b> Associated Game: </b> {$info[1]} </p>
                <p><b> Age: </b> {$info[2]} + </p>
                <p><b> Players: </b> {$info[3]} </p>
            </div></div>
            <div class="col-md-8 col-lg-8">
              {if (sizeof($rules)!=0)}
                {for $x = 0 to sizeof($rules)}
                  {if $category[$x] != $category[$x-1]}
                    <h3 style="color: rgb(91, 136, 216)"><strong>{$category[$x]}</strong></h3>
                  {/if}
                  {if !is_null($subcategory[$x]) And $subcategory[$x] != $subcategory[$x-1]}
                    <h4>{$subcategory[$x]}</h4>
                  {/if}
                  <article><p>{$rules[$x]}</p></article>
                {/for}
              {else}
                  <p><strong>No expansion rules in our database! :( Check back later!</strong></p>
              {/if}
            </div>
        </div>
    </div>
</div>
<script src="./script/jquery-3.3.1.min.js"></script>
<script src="./scripts/bootstrap.min.js"></script>
</body>
</html>
