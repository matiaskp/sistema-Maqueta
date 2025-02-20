import React from 'react'


const ContactUs = () => {
  return (
    <div>
        <section className="bg-gray-100">
    <div className="max-w-7xl mx-auto py-16 px-4 sm:px-6 lg:py-20 lg:px-8">
        <div className="max-w-2xl lg:max-w-4xl mx-auto text-center">
            <h2 style={{marginTop:"5rem"}} className="text-3xl font-extrabold text-gray-900">Como Llegar</h2>
            <p className="mt-4 text-lg text-gray-500">Nos encontramos en la Avda. Eusebio Ayala 2119 c/ Bartolomé de las casas</p>
        </div>
        <div className="mt-16 lg:mt-20">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
                <div className="rounded-lg overflow-hidden">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3606.92994147652!2d-57.604550326241565!3d-25.306557777640688!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x945da8638d3c7ed9%3A0xd991354db91a0ce9!2sEXITO%20Repuestos%20linea%20argentina!5e0!3m2!1ses-419!2spy!4v1740040650378!5m2!1ses-419!2spy"
                        width="100%" height="480" style={{border:0}} allowFullScreen="" loading="lazy"></iframe>
                </div>
                <div className='ContactUsContainer'>
                </div>
            </div>
        </div>
    </div>
</section>
    </div>
  )
}

export default ContactUs