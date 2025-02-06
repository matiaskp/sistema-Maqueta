import React,{useState} from 'react'
import { FaArrowAltCircleLeft } from "react-icons/fa";
import { FaArrowAltCircleRight } from "react-icons/fa";


const Testimonials = () => {
    const [currentIndex,setCurrentIndex] = useState(0)
    const testimonials = [
        {
          quote: "Excelente atención",
          author: "Richard Figueredo",
        },
        {
          quote: "Excelente atencion. Muchísimas gracias",
          author: "Laura Milone",
        },
        {
            quote: "Muy buena atencion",
            author: "Sergio Ramon Troche Romero",
          },
          {
            quote: "Excelente atención",
            author: "Fernando Rolon",
          },
          {
            quote: "Excelente el lugar",
            author: "Mateo Jose Gonzalez Fernandez",
          },
          {
            quote: "Espetacular la atencion",
            author: "Neris Garceteá",
          },
          {
            quote: "Sin duda comsegui todos los respuesto para mi megane ay en ese local cuando s3 me rompio el auto en Paraguay gracias saludo desde Bs As",
            author: "Richard Fernando Ayala Guzman",
          },
      ];
      const handlePrevClick  = () => {
        setCurrentIndex(
            (currentIndex + testimonials.length -1) % testimonials.length
        )
      }
      const handleNextClick = () => {
        setCurrentIndex(
        (currentIndex+1) % testimonials.length
        )
      }
  return (
    <div className='testimonialsContainerOne'>
        <h2>Reseñas de clientes</h2>
        <div className='testimonialsContainerTwo'>
            <p>{testimonials[currentIndex].quote}</p>
            <br />
            <p>{testimonials[currentIndex].author}</p>
            <p>⭐⭐⭐⭐⭐</p>
            <div className="testimonialsBtnContainer">
        <div className="testimonialArrow" onClick={handlePrevClick}><FaArrowAltCircleLeft/></div><div className="testimonialArrow" onClick={handleNextClick}><FaArrowAltCircleRight/></div>
        </div>
        </div>
    </div>
  )
}

export default Testimonials