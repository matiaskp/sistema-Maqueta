import React from 'react'
import Navbar from './Navbar'
import { useNavigate } from 'react-router'

const Success = () => {
  const navigate = useNavigate()
  const handleVolver = () => {
    navigate("/")
  }
  return (
    <div className='successContainer'>
      <Navbar/>
      <div className="successHeader">
        <img className='successImg' src="../../images/logo2.png" alt="" />
      <h1>Su pedido ha sido procesado exitosamente!</h1>
      </div>
      <div className='successVolver'>
        <div onClick={handleVolver} className='successInicio'>
        <img src="/images/home.png" alt="volver al inicio" />
        <h2>Volver al inicio</h2>
        </div>
      </div>
    </div>
  )
}

export default Success