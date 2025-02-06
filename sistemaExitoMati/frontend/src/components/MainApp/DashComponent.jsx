import React from 'react';
import Navbar from './Navbar';

const DashComponent = () => {
    return (
        <div style={{ width: '100%', height: '100vh' }}>
            <Navbar/>
            <iframe 
                src="http://localhost:8050"  // Dirección donde está corriendo la app Dash
                width="100%" 
                height="100%" 
                style={{ border: 'none' }}
                title="Dash App"
            />
        </div>
    );
};

export default DashComponent;
