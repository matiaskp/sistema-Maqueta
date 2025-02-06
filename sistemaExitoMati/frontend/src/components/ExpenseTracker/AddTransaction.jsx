import React, {useState, useContext} from 'react'
import { GlobalContext } from '../../context/GlobalState'
import axios from "axios"

export const AddTransaction = () => {
  const [text, setText] = useState('');
  const [amount, setAmount] = useState(0);

  const { addTransaction } = useContext(GlobalContext);

  const onSubmit = e => {
    e.preventDefault();
    axios.post("http://localhost:5000/transaction",{text:text,amount:+amount})
    .catch(err=>console.log(err))
    const newTransaction = {
      id: Math.floor(Math.random() * 100000000),
      text,
      amount: +amount
    }

    addTransaction(newTransaction);
  }

  return (
    <div className='addTransaction'>
      <h3>Añadir nueva transacción</h3>
      <form onSubmit={onSubmit}>
        <div className="form-control">
          <label htmlFor="text">Texto</label>
          <input type="text" value={text} onChange={(e) => setText(e.target.value)} placeholder="Ingresar texto..." />
        </div>
        <div className="form-control">
          <label htmlFor="amount"
            >Cantidad <br />
            (negativo - gasto, positivo - ingreso)</label>
          <input type="number" value={amount} onChange={(e) => setAmount(e.target.value)} placeholder="Ingresar cantidad..." />
        </div>
        <button className="btn">Añadir transacción</button>
      </form>
    </div>
  )
}
export default AddTransaction