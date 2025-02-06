import React from 'react'
import { Link } from 'react-router-dom'

const Navbar = () => {
  return (
    <>
    <nav className="navbarOne">
        <h1><Link to="/">Exito Repuestos Línea Argentina ®️</Link></h1>
        <ul className='linkList'>
            <li><Link to="/tareas">📚✅</Link></li>
            <li><Link to="/registroGastos">💲➕</Link></li>
            <li><Link to="/graficos">📈🔧</Link></li>
            <li><Link to="/añadir">🛒💰</Link></li>
        </ul>
    </nav>
    </>
  )
}

export default Navbar