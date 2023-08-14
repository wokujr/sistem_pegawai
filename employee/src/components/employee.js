import React from "react"

function Employee(props){
    if (!Array.isArray(props.employees)) {
        return <div>No employees data available.</div>;
    }
    return (
        <div>
            <h1>From API with rails 7</h1>
            {props.employees.map((employee) => {
                return(
                    <div key={employee.id}>
                        <h2>{employee.name}</h2>
                        <h3> {employee.age}</h3>
                    </div>
                )
            })}
        </div>
    )
}

export default Employee