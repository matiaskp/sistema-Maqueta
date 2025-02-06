import React, { useState, useEffect } from 'react';
import { Link } from "react-router"

const StoreMain = () => {
    const [image, setImage] = useState([]); // Estado para las imágenes

    useEffect(() => {
        fetch("/Store.json") // Cargar el archivo JSON
            .then(response => response.json()) // Convertir a JSON
            .then(data => setImage(data)) // Asignar las imágenes al estado
            .catch(err => console.log(err));
    }, []);

    const imagesToShow = image.slice(0, 6); // Seleccionar solo las primeras 6 imágenes

    return (
        <section className="store">
            <div className="store-wrapper" id="TiendaA">
                <div className="store-inner">
                    {/* Renderizamos las primeras 6 imágenes */}
                    {imagesToShow.map((img, index) => (
                        <img key={index} src={img.src} alt={img.alt} />
                    ))}
                </div>
            </div>
            {/* Botón para redirigir al enlace */}
                <button><Link to="/tienda">Ver Más</Link></button>
        </section>
    );
};

export default StoreMain;
