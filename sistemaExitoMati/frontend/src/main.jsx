import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.jsx'
import { createBrowserRouter,RouterProvider } from 'react-router-dom'
import ToDoList from "./components/toDoList/ToDoList.jsx"
import ExpenseMain from './components/ExpenseTracker/ExpenseMain.jsx'
import DashComponent from './components/MainApp/DashComponent.jsx'
import ProductUpload from "./components/ProductUpload/ProductUpload.jsx"
import CustomerOrders from "./components/CustomersOrders/CustomersOrders.jsx"

const router = createBrowserRouter([
  {
    path:"/",
    element:<App/>
  },
  {
    path:"/tareas",
    element:<ToDoList/>
  },
  {
    path:"/registroGastos",
    element:<ExpenseMain/>
  },
  {
    path:"/graficos",
    element:<DashComponent/>
  },
  {
    path:"/añadir",
    element:<ProductUpload/>
  },
  {
    path:"/pedidos",
    element:<CustomerOrders/>
  },
])

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <RouterProvider router={router}/>
  </StrictMode>,
)
