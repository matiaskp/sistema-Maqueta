import React from 'react'
import Balance from "./Balance"
import IncomeExpenses from "./IncomeExpenses"
import TransactionList from "./TransactionList"
import AddTransaction from "./AddTransaction"
import {GlobalProvider} from "../../context/GlobalState"
import Header from './Header'
import Navbar from "../MainApp/Navbar"

const ExpenseMain = () => {
  return (
    <>
    <Navbar/>
    <div className="expenseContainer">      
      <GlobalProvider>
      <div className="container">
      <Balance/>
      <IncomeExpenses/>
      <TransactionList/>
      <AddTransaction/>
      </div>
    </GlobalProvider>
    </div>
    </>
  )
}

export default ExpenseMain