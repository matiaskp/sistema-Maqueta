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
            <Link to="/"><li>Inicio 🏠</li></Link>
            <Link to="/tareas"><li>Tareas 📚</li></Link>
            <Link to="/registroGastos"><li>Gastos 💲</li></Link>
            <Link to="/graficos"><li>Gráficas 📈</li></Link>
            <Link to="/añadir"><li>Productos 🛒</li></Link>
            <Link to="/pedidos"><li>Pedidos 📦</li></Link>
        </ul>}
    </>
  )
}

export default Navbar