document.addEventListener("DOMContentLoaded", () => {
    const positionSelect = document.getElementById("position-select");
    const salaryAmountField = document.getElementById("salary-amount-field");

    positionSelect.addEventListener("change", () => {
        const selectedOption = positionSelect.options[positionSelect.selectedIndex];
        const salaryAmount = selectedOption.dataset.salary;
        salaryAmountField.value = salaryAmount;
    });
});
