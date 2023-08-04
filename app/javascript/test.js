const positionSelect = document.getElementById("position-select");
    positionSelect.addEventListener("change", () => {
        const selectedOption = positionSelect.value
        console.log(selectedOption)
        const xhr = new XMLHttpRequest()

        xhr.open("GET", `http://localhost:3000/position/${selectedOption}`, true)

        xhr.onload = () =>{
            if(xhr.status === 200)
            {
                const responseData = JSON.parse(xhr.responseText)
                const inputSalary = document.getElementById("salary-amount-field")
                inputSalary.value = responseData.salary;
            }
            else
            {
                console.error("request failed")
            }
        }
        xhr.send()
    });
