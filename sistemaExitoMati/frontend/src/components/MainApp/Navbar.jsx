import React,{useState} from 'react'
import { Link } from 'react-router-dom'
import { RxHamburgerMenu } from "react-icons/rx"
import { VscChromeClose } from "react-icons/vsc"

const Navbar = () => {
  const [hamburState,setHamburState] = useState(true)
  return (
    <>
    <nav className="navbarOne">
      <div onClick={()=>setHamburState(!hamburState)} className="hamburContainer">
        {hamburState ? <RxHamburgerMenu/> : <VscChromeClose/>}
      </div>
        <h1 style={{marginRight:"2rem"}}><Link to="/">Exito Repuestos Línea Argentina ®️</Link></h1>
    </nav>
    {hamburState?<div style={{display:"none"}}></div>:<ul className='linkList'>
            <li><Link to="/">Inicio 🏠</Link></li>
            <li><Link to="/tareas">Tareas 📚</Link></li>
            <li><Link to="/registroGastos">Gastos 💲</Link></li>
            <li><Link to="/graficos">Gráficas 📈</Link></li>
            <li><Link to="/añadir">Productos 🛒</Link></li>
            <li><Link to="/pedidos">Pedidos 📦</Link></li>
        </ul>}
    </>
  )
}

export default Navbar