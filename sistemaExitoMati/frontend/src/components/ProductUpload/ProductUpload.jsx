import React, { useState } from "react";
import Navbar from "../MainApp/Navbar"

const UploadProductImage = () => {
  const [image, setImage] = useState(null);
  const [alt, setAlt] = useState(''); // Nombre del producto
  const [price, setPrice] = useState(''); // Precio
  const [desc, setDesc] = useState(''); // Descripción

  const handleImageChange = (e) => {
    setImage(e.target.files[0]);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    // Validación simple para asegurarse de que todos los campos estén llenos
    if (!image || !alt || !price) {
      alert('Por favor, complete todos los campos.');
      return;
    }

    // Crear un FormData y agregar los datos del producto
    const formData = new FormData();
    formData.append("image", image);
    formData.append("alt", alt);   // Nombre del producto
    formData.append("price", price); // Precio
    formData.append("desc", desc);   // Descripción

    try {
      const response = await fetch("http://localhost:5000/upload", {
        method: "POST",
        body: formData,
      });

      if (response.ok) {
        console.log("Producto cargado exitosamente");
        setImage(null)
        setAlt("")
        setPrice("")
        setDesc("")
      } else {
        console.error("Error al cargar el producto");
      }
    } catch (error) {
      console.error("Error de red", error);
    }
  };

  return (
    <>
    <Navbar/>
    <form onSubmit={handleSubmit} className="formUpload">
      <input className="uploadSelect" type="file" onChange={handleImageChange} accept="image/*" required />
      
      <div>
        <label htmlFor="alt">Nombre del Producto:</label>
        <input
          type="text"
          id="alt"
          value={alt}
          onChange={(e) => setAlt(e.target.value)}
          required
        />
      </div>

      <div>
        <label htmlFor="price">Precio:</label>
        <input
          type="number"
          id="price"
          value={price}
          onChange={(e) => setPrice(e.target.value)}
          required
        />
      </div>

      <div>
        <label htmlFor="desc">Descripción (Opcional):</label>
        <textarea
          id="desc"
          value={desc}
          onChange={(e) => setDesc(e.target.value)}
        />
      </div>

      <button type="submit">Cargar Producto</button>
    </form>
    </>
  );
};

export default UploadProductImage;
