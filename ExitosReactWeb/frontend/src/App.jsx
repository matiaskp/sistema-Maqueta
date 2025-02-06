import React from 'react'
import '@fontsource/roboto/300.css';
import '@fontsource/roboto/400.css';
import '@fontsource/roboto/500.css';
import '@fontsource/roboto/700.css';
import Navbar from './components/Navbar';
import MainCaroussel from './components/MainCaroussel';
import Context from './Context/Context';

const App = () => {
  return (
    <Context>
      <Navbar/>
      <MainCaroussel/>
    </Context>
  )
}

export default App
