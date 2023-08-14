import './App.css';
import axios  from "axios";
import Employee from "./components/employee";
import {useEffect, useState} from "react";

const APIUrl = "http://localhost:3000/karyawans";
function getAPIData(){
    return axios.get(APIUrl)
        .then((response) => response.data)
        .catch((error)=>{console.error("API request error", error);
            throw error;})
}

function App() {
    const[employees, setEmployees] = useState([]);
    useEffect(() => {
        let mounted = true;
        getAPIData().then((data) => {
            if (mounted) {
                setEmployees(data);
            }
        });
        return () => (mounted = false);
    }, [])

  return (
    <div className="App">
      <Employee employees={employees} />
    </div>
  );
}

export default App;
