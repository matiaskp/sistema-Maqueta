import React, { useState, useEffect } from 'react';
import axios from "axios";
import Navbar from "../MainApp/Navbar"
import EditIcon from '@mui/icons-material/Edit';
import DeleteForeverSharpIcon from '@mui/icons-material/DeleteForeverSharp';

const TodoList = () => {
    const [todos, setTodos] = useState([]);
    const [text, setText] = useState("");
    const [textUpdate, setTextUpdate] = useState("");
    const [myState, setMyState] = useState(false);
    const [savedId, setSavedId] = useState(0);
    const [todoToUpdate, setTodoToUpdate] = useState(null); // Inicializado como null

    useEffect(() => {
        axios.get("http://localhost:5000/todos")
            .then(response => setTodos(response.data))
            .catch(err => console.log(err));
    }, []);

    const handleAddTodo = () => {
        if (text.trim()) {
            axios.post("http://localhost:5000/todos", { todo: text })
                .then(response => setTodos([...todos, response.data]))
                .catch(err => console.log(err));
            setText("");
        }
    };

    const handleDeleteTodo = (id) => {
        axios.delete(`http://localhost:5000/delete/${id}`)
            .then(() => {
                setTodos(todos.filter(todo => todo.id !== id));
            })
            .catch(err => console.log(err));
    };

    const buttonShow = (id) => {
        if (myState === false) {
            setMyState(true);
            setSavedId(id);
            const selectedTodo = todos.find(todo => todo.id === id);
            setTodoToUpdate(selectedTodo); // Guarda el objeto completo de la tarea
            setTextUpdate(selectedTodo.todo); // Prellena el campo con el valor actual de la tarea
        }
    };

    const buttonClose = () => {
        if (textUpdate.trim() && myState === true) {
            setMyState(false);
            axios.put(`http://localhost:5000/update/${savedId}`, { todo: textUpdate })
                .catch(err => console.log(err));
            setTodos(todos.map(todo => todo.id === savedId ? { id: savedId, todo: textUpdate } : todo));
            setSavedId(0);
            setTextUpdate(""); // Limpia el campo de texto después de actualizar
            setTodoToUpdate(null); // Restablece el todoToUpdate a null
        }
    };

    return (
        <>
        <Navbar/>
        <div className='todoContainer'>
            <h3 style={myState ? { "display": "none" } : { "display": "block" }}>Tareas Pendientes</h3>

            {/* Sección para actualizar el todo seleccionado */}
            {myState && todoToUpdate && (
                <div className="showUpdateTodo">
                    <h4>Actualizar tarea</h4>
                    <input
                        className='actualizarInput'
                        placeholder='actualizar tarea...'
                        onChange={e => setTextUpdate(e.target.value)}
                        value={textUpdate || ""} // Aseguramos que el valor sea siempre una cadena vacía si no hay texto
                        type="text"
                    />
                    <div className="buttonTodoContainer">
                        <button className='salir' onClick={()=>setMyState(false)}>Salir</button>
                        <button onClick={buttonClose}>Actualizar</button>
                    </div>
                </div>
            )}

            {/* Sección para mostrar todos los todos y añadir uno nuevo */}
            {!myState && (
                <div>
                    <ul>
                        {todos.map((todo) => (
                            <li key={todo.id}>
                                {todo.todo}
                                <div className="todo-items">
                                <p onClick={() => handleDeleteTodo(todo.id)}><DeleteForeverSharpIcon/></p>
                                <p onClick={() => buttonShow(todo.id)}><EditIcon/></p>
                                </div>
                            </li>
                        ))}
                    </ul>
                    <input
                        onChange={(e) => setText(e.target.value)}
                        value={text}
                        placeholder='añadir tarea...'
                        type="text"
                    />
                    <button onClick={handleAddTodo}>Añadir</button>
                </div>
            )}
        </div>
        </>
    );
};

export default TodoList;
