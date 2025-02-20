import React, { useEffect, useState } from "react";
import Navbar from "../MainApp/Navbar";
import axios from "axios";
import { DataGrid } from '@mui/x-data-grid'
import Box from '@mui/material/Box'

const CustomersOrders = () => {
  const [data, setData] = useState([]);
  const [customerInfo, setCustomerInfo] = useState([]);
  const [orders, setOrders] = useState([]);
  
  const columns = [
    { field: 'id', headerName: 'ID', width: 90 },
    {
      field: 'name',
      headerName: 'Nombre',
      width: 150,
      editable: false,
    },
    {
      field: 'email',
      headerName: 'Email',
      width: 200,
      editable: false,
    },
    {
      field: 'phone',
      headerName: 'Teléfono',
      width: 150,
      editable: false,
    },
    {
      field: 'cantidad',
      headerName: 'Cantidad total',
      width: 150,
      editable: false,
    },
    {
      field: 'producto',
      headerName: 'Producto',
      width: 200,
      editable: false,
    },
  ];

  useEffect(() => {
    axios
      .get("http://localhost:5000/customerOrders")
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
  
  // Combinar información del cliente con los pedidos
  const rows = orders.map((order, index) => ({
    id: index + 1, // Generar un ID único basado en el índice
    name: customerInfo[index]?.name, // Acceder al primer cliente
    email: customerInfo[index]?.mail, // Acceder al correo del primer cliente
    phone: customerInfo[index]?.phone, // Acceder al teléfono del primer cliente
    cantidad: order.cantidad,
    producto: order.producto || `Producto ${order.id}`, // Asumiendo que 'producto' es un campo en 'order'
  }));

  return (
    <>
      <Navbar />
      <Box sx={{ height: 400, width: '100%' }}>
        <DataGrid
          rows={rows}
          columns={columns}
          initialState={{
            pagination: {
              paginationModel: {
                pageSize: 5,
              },
            },
          }}
          pageSizeOptions={[5]}
          checkboxSelection
          disableRowSelectionOnClick
        />
      </Box>
    </>
  );
};

export default CustomersOrders;
