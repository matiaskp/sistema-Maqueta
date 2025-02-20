import React from 'react'
import { Link } from 'react-router-dom'

const Home = () => {
  return (
    <div className="homeContainer">
      <div className="boxContainerOne">
      <div className="box boxOne"><Link to="/tareas">Lista de tareas</Link></div>
      <div className="box boxTwo"><Link to="/registroGastos">Registro de gastos</Link></div>
      <div className="box boxTwo"><Link to="/graficos">Resúmenes y Gráficos</Link></div>
      </div>
      <div className="boxContainerTwo">
      <div className="box boxTwo"><Link to="/añadir">Añadir producto a tienda</Link></div>
      <div className="box boxTwo"><Link to="/pedidos">Pedidos de clientes</Link></div>
      <div className="box boxTwo">Visitar tienda en línea</div>
      </div>
      <div className="boxContainerThree">
      <div className="box boxTwo">Proyecto 7...</div>
      <div className="box boxTwo">Proyecto 8...</div>
      </div>
    </div>
  )
}

export default Home