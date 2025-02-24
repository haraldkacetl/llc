
const vorschläge = ["bash", "ls", "whoami", "pwd", "cat", "echo", "mv", "rm", "cp", "grep" , "sed" , "which" , "head" , "tail" , "less" , "more" , "ln" , "rmdir" , "mkdir" , "touch" , "chmod"];

const inputFeld = document.getElementById("test_input");
const autocompleteListe = document.getElementById("autocomplete-list");

let gefilterteVorschläge = [];
let tabIndex = -1; // Index für Tab-Navigation

inputFeld.addEventListener("input", function() {
  const wert = this.value.toLowerCase();
  autocompleteListe.innerHTML = "";
  tabIndex = -1; // Reset Tab-Index

  if (!wert) return;

  gefilterteVorschläge = vorschläge.filter(v => v.toLowerCase().startsWith(wert));

  gefilterteVorschläge.forEach((vorschlag, index) => {
    const eintrag = document.createElement("div");
    eintrag.classList.add("autocomplete-item");
    eintrag.textContent = vorschlag;
    eintrag.dataset.index = index;
    
    eintrag.addEventListener("click", function() {
      inputFeld.value = vorschlag;
      autocompleteListe.innerHTML = "";
      tabIndex = -1; 
    });

    autocompleteListe.appendChild(eintrag);
  });
});

document.addEventListener("click", function(e) {
  if (e.target !== inputFeld) {
    autocompleteListe.innerHTML = "";
    tabIndex = -1; 
  }
});

inputFeld.addEventListener("keydown", function(event) {

  if (event.key === "Tab") {
    event.preventDefault();
    if (gefilterteVorschläge.length === 0) return;

    tabIndex = (tabIndex + 1) % gefilterteVorschläge.length; // Nächstes Element wählen
    inputFeld.value = gefilterteVorschläge[tabIndex];

    // Markierung aktualisieren
    document.querySelectorAll(".autocomplete-item").forEach((item, index) => {
      item.classList.toggle("selected", index === tabIndex);
    });
  }
  if (event.key === "Enter"){
    tmp = inputFeld.value
    console.log(tmp)
    console.log("ENTER PRESSED; TODO SEND TO BASH")

  }
});

function updateTable(newText) {
    // Verschiebe die Zeileninhalte von unten nach oben
    for (let i = 9; i > 1; i--) {
        let current = document.getElementById(`txt_line0${i}`);
        let previous = document.getElementById(`txt_line0${i - 1}`);
        
        if (current && previous) {
            current.innerText = previous.innerText;
        }
    }

    // Setze den neuen Text in die erste Zeile
    let firstRow = document.getElementById("txt_line01");
    if (firstRow) {
        firstRow.innerText = newText;
    }
}
