// app/javascript/salary_autofill.js

function setSalary(){
    const positionSelect = document.getElementById("position-select");
    const salaryField = document.getElementById("salary-field");

    positionSelect.addEventListener("change", () => {
        const selectedOption = positionSelect.value;
        console.log(selectedOption)

        // Convert @position to JSON and insert it directly into the JavaScript
        const positionData = JSON.parse(positionSelect.dataset.positionData);

        const selectedPosition = positionData.find((p) => p.id == selectedOption);
        if (selectedPosition) {
            salaryField.value = selectedPosition.salary;
        } else {
            // Clear the salary field if the selected position is not found
            salaryField.value = "";
        }
    });
}
document.addEventListener("turbo:load", setSalary)
