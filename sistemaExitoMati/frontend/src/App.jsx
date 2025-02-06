import React from 'react'
import Navbar from './components/MainApp/Navbar'
import Home from "./components/MainApp/Home"

const App = () => {
  return (
    <div className="appContainer">
      <Navbar/>
      <Home/>
    </div>
  )
}

export default App