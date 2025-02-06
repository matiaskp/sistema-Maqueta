import { createContext,useReducer,useEffect } from "react"
import AppReducer from "./AppReducer"
import axios from "axios"

const initialState = {
  transactions: [
  ]
}

export const GlobalContext = createContext(initialState)

export const GlobalProvider =  ({children}) => {
  const [state,dispatch] = useReducer(AppReducer,initialState)

  function deleteTransaction(id) {
    axios.delete(`http://localhost:5000/deleteTransaction/${id}`)
    dispatch({
      type:"DELETE_TRANSACTION",
      payload:id
    })
  }
  function addTransaction(transaction) {
    dispatch({
      type:"ADD_TRANSACTION",
      payload:transaction
    })
  }
  useEffect(()=>{
    axios.get("http://localhost:5000/transaction")
    .then(response=>{
      dispatch({
        type:"SET_TRANSACTIONS",
        payload:response.data
      })
    })
    .catch(err=>console.log(err))
  },[])
  return(
    <GlobalContext.Provider value={{transactions:state.transactions,
      addTransaction,deleteTransaction
    }}>
      {children}
    </GlobalContext.Provider>
  )
}

