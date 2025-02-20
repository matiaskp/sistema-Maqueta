import React, { useContext,useState } from 'react';
import { context } from "../Context/Context";
import Navbar from "../components/Navbar";
import Formulario from './Formulario';
import { Link } from "react-router-dom";

const Cart = () => {
  const { cart, setCart } = useContext(context);
  const [state,setState] = useState(false)

  const increaseQuantity = (id) => {
    setCart((prevCart) =>
      prevCart.map((item) =>
        item.id === id ? { ...item, quant: item.quant + 1 } : item
      )
    );
  };

  const decreaseQuantity = (id) => {
    setCart((prevCart) =>
      prevCart.map((item) =>
        item.id === id && item.quant > 1 ? { ...item, quant: item.quant - 1 } : item
      )
    );
  };

  const deleteItem = (id) => {
    setCart((prevCart) => prevCart.filter((item) => item.id !== id));
  };
  const handleState = () => {
    if (state === false){
      setState(true)
    }
    else{
      console.log("somenthing went wrong:...!")
    }
  }

  return (
    <div>
      <header>
        <nav className="navTienda">
          <div className="nav-gmail">
            <Link to="/" className="linkToTienda">
              <img src="/images/home.png" alt="Home icon" />
              <p>volver al inicio</p>
            </Link>
          </div>
          <div className="nav-gmail">
            <Link to="/tienda" className="linkToTienda">
              <img src="/images/tiendaEnLínea.png" alt="Home icon" />
              <p>ver Tienda en línea</p>
            </Link>
          </div>
        </nav>
      </header>
      <div className='cartContainer'>
        <h1 style={state ? {display:"none"} : {}}>Lista de pedidos:</h1>
        {cart.length === 0 ? (
          <p>Su carrito esta vacio.</p>
        ) : (
          cart.map((item) => (
            <div style={state ? {display:"none"}:{}} className='cartBox' key={item.id}>
              {/* Use /products/ prefix to access images in public/products */}
              <img src={`/products/${item.src}`} alt={item.alt} className="cartImg" />
              <div style={{display:"flex"}} className="deleteCartItem">
                <p>{item.alt}</p>
              </div>
              <div className='cartBoxButton'>
                <button className='boxLeft' onClick={() => increaseQuantity(item.id)}>+</button>
                <p>{item.quant}</p>
                <button className='boxRight' onClick={() => decreaseQuantity(item.id)}>-</button>
              </div>
              <p>{item.price*item.quant}</p>
              <button className='deleteCartItem' onClick={() => deleteItem(item.id)}>❌</button>
            </div>
          ))
        )}
        <div style={cart.length > 0 ?{}:{display:"none"}}>
        <button onClick={handleState} style={state ? {display:"none"} : {}} className='finalizarBtn'>Finalizar pedido</button>
        </div>
      </div>
      <Formulario state={state}/>
    </div>
  );
};

export default Cart;
