import React, { useState, useEffect, useContext } from 'react';
import { Link } from "react-router-dom";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import Slider from "react-slick";
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import CardMedia from '@mui/material/CardMedia';
import Typography from '@mui/material/Typography';
import Button from '@mui/material/Button';
import CardActionArea from '@mui/material/CardActionArea';
import CardActions from '@mui/material/CardActions';
import ShoppingCartIcon from '@mui/icons-material/ShoppingCart';
import { ReactTyped } from "react-typed";
import { context } from '../Context/Context';
import Testimonials from './Testimonials';

const TiendaEnLinea = () => {
  const settings = {
    dots: true,
    lazyLoad: true,
    infinite: true,
    speed: 500,
    slidesToShow: 1,
    slidesToScroll: 1,
    initialSlide: 2,
    autoplay: true,
  };

  const [images, setImages] = useState([]);
  const [showcase,setShowcase] = useState([]);
  const [loading, setLoading] = useState(true); // Loading state
  const [error, setError] = useState(null); // Error state
  const [searchTerm, setSearchTerm] = useState(""); // State for search input
  const { setCart } = useContext(context);

  // Fetch products and images from the correct JSON file in the public folder
  useEffect(() => {
    fetch('/products.json') // Correct path to the JSON file in the public folder
      .then((response) => response.json())
      .then((data) => {
        setImages(data);
        setLoading(false); // Set loading to false when data is fetched
      })
      .catch((err) => {
        console.log(err);
        setError("Failed to load images."); // Error handling
        setLoading(false);
      });
    fetch("Store.json")
    .then((response) => response.json())
    .then((data) => {
      setShowcase(data)
    })
    .catch(err=>console.log(err))
  }, []);

  // If the data is loading, show a loading message
  if (loading) {
    return <div>Loading...</div>;
  }

  // If there was an error fetching the data, show an error message
  if (error) {
    return <div>{error}</div>;
  }

  // Filter the products based on the search term
  const filteredProducts = images.filter((img) =>
    img.alt.toLowerCase().includes(searchTerm.toLowerCase())
  );

  // Add product to cart
  const saveCart = (index) => {
    const productToAdd = images.find(img => img.id === index);
    if (productToAdd) {
      setCart(prevCart => {
        // Avoid duplicates
        if (prevCart.some(product => product.id === productToAdd.id)) {
          return prevCart; // No change if product already exists
        }
        const updatedCart = [...prevCart, productToAdd]; // Add product to cart
        localStorage.setItem('cart', JSON.stringify(updatedCart)); // Save to localStorage
        return updatedCart;
      });
    }
  };

  return (
    <div>
      <header>
        <nav className="navTienda">
          <div className="nav-gmail">
            <Link to="/" className="linkToTienda">
              <img src="/images/home.png" alt="Home icon" />
              <p>volver al inicio</p>
            </Link>
          </div>
          <div className="nav-gmail">
            <Link to="/cart" className="linkToTienda">
              <img src="/images/carrito.png" alt="Home icon" />
              <p>ver carrito</p>
            </Link>
          </div>
        </nav>
      </header>

      <div className="tiendaHeaders">
        <h1 style={{ paddingTop: "100px" }}>Bienvenidos a la tienda en línea</h1>
        <h3 style={{ textAlign: "center", paddingTop: "20px", paddingBottom: "10px" }}>
          <ReactTyped strings={["de Exito Repuestos y accesorios", "Busca por nombre de producto", "Echa un vistazo a los productos más vendidos", "Busca por categorías", "de Exito Repuestos y accesorios"]} typeSpeed={40} />
        </h3>
      </div>

      <div className="footerTienda">
        <h3>CON MÁS DE 30 AÑOS DE EXPERIENCIA EN EL MERCADO ENTREGÁNDOTE LA MEJOR CALIDAD EN REPUESTOS PARA TU VEHÍCULO</h3>
        <div className="footerTiendaContainer">
          <div className="contact-wrapperTienda">
            <div className="contact-text1Tienda">
              <img src="/images/phone1-removebg-preview.png" alt="Phone" />
              <p>(021) 201 306</p>
              <img src="/images/wha1.png" alt="WhatsApp" />
              <p>(0981) 797 434</p>
              <img src="/images/face1-removebg-preview.png" alt="Facebook" />
              <p>Exito Repuestos Línea Argentina</p>
              <img src="/images/gmail1-removebg-preview.png" alt="Gmail" />
              <p>exitorepuestos2021@gmail.com</p>
              <img src="/images/home.png" alt="Home" />
              <p>Avda. Eusebio Ayala 2119 c/ Bartolomé de las casas</p>
            </div>
          </div>
          <img src="/images/exitosLocal.jpg" alt="Exitos Local" />
        </div>
      </div>

      {/* Tienda en línea section */}
      <section className="tiendaProductos">
        <h2>Echa un vistazo a nuestro catálogo de productos</h2>
        <div className="tiendaBuscar">
          <input
            placeholder="Buscar por producto...🔎"
            type="text"
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)} // Update searchTerm on input change
          />
        </div>

        <div className="productsSearch">
          {filteredProducts.slice(0, 6).map((img) => (
            <Card sx={{ maxWidth: 345 }} key={img.id}>
              <CardActionArea>
                <CardMedia
                  component="img"
                  height="140"
                  image={`/products/${img.src}`} // Correct path to images
                  alt={img.alt}
                />
                <CardContent>
                  <Typography gutterBottom variant="h5" component="div">
                    {img.alt}
                  </Typography>
                  <Typography variant="body2" sx={{ color: 'text.secondary' }}>
                    {img.desc}
                  </Typography>
                  <Typography variant="body2" sx={{ color: 'text.secondary' }}>
                    {img.price ? <p>precio: {img.price}</p> : <p>n/e</p>}
                  </Typography>
                </CardContent>
              </CardActionArea>
              <CardActions>
                <Button onClick={() => saveCart(img.id)} size="small" color="primary">
                  <ShoppingCartIcon /> Añadir
                </Button>
              </CardActions>
            </Card>
          ))}
        </div>
      </section>

      <div className="masVendidos">
        <h2>Productos más vendidos</h2>
        <Slider className="Slider" {...settings}>
          {showcase.map((img) => (
            <div key={img.id}>
              <img src={`/products/${img.src}`} alt={img.alt} className="slider-image" />
            </div>
          ))}
        </Slider>
      </div>
      <Testimonials/>
      <footer>
        <div className="info-medios">
          <h1>Información y medios corporativos</h1>
          <p>Avda. Eusebio Ayala 2119 c/ Bartolomé de las casas</p>
          <p>exitorepuestos2021@gmail.com</p>
          <p>(021) 201 306</p>
          <p>+595 981 797 434</p>
        </div>
        <div className="horarios">
          <h1>Horarios de atención</h1>
          <p>Lunes a Viernes: 08:00 a 12:00hs || 13:00 a 17:00hs.</p>
          <p>Sábados: 08:00 a 12:00hs.</p>
        </div>
      </footer>
    </div>
  );
};

export default TiendaEnLinea;
