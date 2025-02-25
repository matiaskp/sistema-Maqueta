import React, { useEffect, useState } from "react";
import Navbar from "../MainApp/Navbar";
import axios from "axios";
import { DataGrid } from '@mui/x-data-grid'
import Box from '@mui/material/Box'

const CustomersOrders = () => {
  const [data, setData] = useState([]);
  const [customerInfo, setCustomerInfo] = useState([]);
  const [orders, setOrders] = useState([]);

  useEffect(() => {
    axios
      .get("http://localhost:5001/customerOrders")
      .then((response) => {
        console.log("Datos recibidos de la API:", response.data);
  
        // Extraemos los datos de los sub-arreglos
        const [info, orders] = response.data;
  
        console.log("Información del cliente:", info);
        console.log("Pedidos:", orders);
  
        setCustomerInfo(info);
        setOrders(orders);
      })
      .catch((err) => console.error("Error al obtener los datos:", err));
  }, []);

  return (
    <>
      <Navbar />
      <Box sx={{ padding: 2 }}>
        <table style={{ width: '100%', borderCollapse: 'collapse' }}>
          <thead>
            <tr>
              <th style={{ padding: '8px', border: '1px solid #ddd', textAlign: 'left' }}>ID</th>
              <th style={{ padding: '8px', border: '1px solid #ddd', textAlign: 'left' }}>Nombre y Apellido</th>
              <th style={{ padding: '8px', border: '1px solid #ddd', textAlign: 'left' }}>Mail</th>
              <th style={{ padding: '8px', border: '1px solid #ddd', textAlign: 'left' }}>Teléfono</th>
              <th style={{ padding: '8px', border: '1px solid #ddd', textAlign: 'left' }}>Fecha</th>
              <th style={{ padding: '8px', border: '1px solid #ddd', textAlign: 'left' }}>Pedidos</th>
            </tr>
          </thead>
          <tbody>
           {customerInfo.map((item,index)=>(
            <tr key={index}>
            <td style={{ padding: '8px', border: '1px solid #ddd' }}>{index}</td>
            <td style={{ padding: '8px', border: '1px solid #ddd' }}>{item.name} {item.lastName}</td>
            <td style={{ padding: '8px', border: '1px solid #ddd' }}>{item.mail}</td>
            <td style={{ padding: '8px', border: '1px solid #ddd' }}>{item.phone}</td>
            <td style={{ padding: '8px', border: '1px solid #ddd' }}>fecha</td>
            <td style={{ padding: '8px', border: '1px solid #ddd' }}><button>ver pedidos</button></td>
          </tr>
           ))}
          </tbody>
        </table>
      </Box>
    </>
  );
};

export default CustomersOrders;
