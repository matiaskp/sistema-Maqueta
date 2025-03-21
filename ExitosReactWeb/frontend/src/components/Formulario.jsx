import React, { useState, useContext } from 'react';
import { useNavigate } from 'react-router-dom'; // Importa useNavigate
import axios from 'axios';
import { context } from '../Context/Context'; // Ajusta el path si es necesario

function Formulario(props) {
  const { cart, setCart } = useContext(context);
  // Estado para manejar los valores del formulario
  const [formData, setFormData] = useState({
    nombre: '',
    apellido: '',
    email: '',
    telefono: '',
    mensaje: '',
  });

  // Estado para manejar los errores de validación
  const [errors, setErrors] = useState({
    nombre: '',
    apellido: '',
    telefono: '',
  });

  const navigate = useNavigate(); // Inicializa el hook de navegación

  // Maneja los cambios en los campos del formulario
  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prevData) => ({
      ...prevData,
      [name]: value,
    }));
  };

  // Maneja el envío del formulario
  const handleSubmit = (e) => {
    e.preventDefault();

    // Validación
    let formErrors = { nombre: '', apellido: '', telefono: '' };

    if (!formData.nombre) {
      formErrors.nombre = 'El nombre es obligatorio';
    }

    if (!formData.apellido) {
      formErrors.apellido = 'El apellido es obligatorio';
    }

    if (!formData.telefono) {
      formErrors.telefono = 'El número de teléfono es obligatorio';
    }

    // Si hay errores, no se envía el formulario
    if (formErrors.nombre || formErrors.apellido || formErrors.telefono) {
      setErrors(formErrors);
    } else {
      // Envía datos al servidor
      axios
        .post('http://localhost:5000/form', {
          name: formData.nombre,
          lastName: formData.apellido,
          phone: formData.telefono,
          mail: formData.email,
          cart:cart
        })
        .then((response) => {
          console.log(response);
          alert('Formulario enviado con éxito');
          navigate('/success');
        })
        .catch((err) => {
          console.error(err);
          alert('Error al enviar el formulario');
        });

      // Limpia el formulario y los errores
      setFormData({ nombre: '', apellido: '', email: '', telefono: '', mensaje: '' });
      setErrors({ nombre: '', apellido: '', telefono: '' });
    }
  };

  return (
    <div style={props.state ? {} : { display: 'none' }} className="formContainer">
      <h2>Formulario de Contacto</h2>
      <form onSubmit={handleSubmit}>
        {/* Nombre */}
        <div>
          <label htmlFor="nombre">Nombre</label>
          <input
            type="text"
            id="nombre"
            name="nombre"
            value={formData.nombre}
            onChange={handleChange}
            required
          />
          {errors.nombre && <p style={{ color: 'red' }}>{errors.nombre}</p>}
        </div>

        {/* Apellido */}
        <div>
          <label htmlFor="apellido">Apellido</label>
          <input
            type="text"
            id="apellido"
            name="apellido"
            value={formData.apellido}
            onChange={handleChange}
            required
          />
          {errors.apellido && <p style={{ color: 'red' }}>{errors.apellido}</p>}
        </div>

        {/* Correo electrónico (opcional) */}
        <div>
          <label htmlFor="email">Correo electrónico (opcional)</label>
          <input
            type="email"
            id="email"
            name="email"
            value={formData.email}
            onChange={handleChange}
          />
        </div>

        {/* Número de teléfono */}
        <div>
          <label htmlFor="telefono">Número de Teléfono</label>
          <input
            type="tel"
            id="telefono"
            name="telefono"
            value={formData.telefono}
            onChange={handleChange}
            required
          />
          {errors.telefono && <p style={{ color: 'red' }}>{errors.telefono}</p>}
        </div>

        {/* Botón de envío */}
        <button className="formEnviar" type="submit">
          Enviar
        </button>
      </form>
    </div>
  );
}

export default Formulario;

