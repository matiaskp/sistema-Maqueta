import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import {createBrowserRouter,RouterProvider} from "react-router-dom"
import './index.css'
import App from './App.jsx'
import TiendaEnLinea from "./components/TiendaEnLinea.jsx"
import Context from './Context/Context.jsx'
import Cart from "./components/Cart.jsx"
import Success from './components/Success.jsx'
import NewNav from './components/NewNav.jsx'

const router = createBrowserRouter([
  {
    path: "/",
    element:<App/>
  },
  {
    path: "/tienda",
    element: <TiendaEnLinea/>
  },
  {
    path: "/cart",
    element: <Cart/>
  },
  {
    path: "/success",
    element: <Success/>
  },
  {
    path: "/newNav",
    element: <NewNav/>
  }
])

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <Context>
    <RouterProvider router={router}/>
    </Context>
  </StrictMode>,
)
