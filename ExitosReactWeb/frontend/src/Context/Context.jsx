import { createContext,useState } from "react"

export const context = createContext()

const Context = ({children}) => {
    const [cart,setCart] = useState([])
  return (
    <context.Provider value={{cart,setCart}}>
            {children}
    </context.Provider>
  )
}

export default Context