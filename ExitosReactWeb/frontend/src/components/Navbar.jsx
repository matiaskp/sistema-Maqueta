import React,{useState} from 'react';
import {Link} from "react-router"
import { RxHamburgerMenu } from "react-icons/rx"
import { VscChromeClose } from "react-icons/vsc"
import { MdOutlineLocalGroceryStore } from "react-icons/md";


const Navbar = () => {
  const [hamburBtn,setHamburBtn] = useState(false)
  return (
    <header>
      <nav className="nav-wrapper">
        <div className="list-wrapper">
          <div style={{cursor:"pointer"}} onClick={()=>setHamburBtn(!hamburBtn)} className="hamburContainer">
          {hamburBtn ? <VscChromeClose/> : <RxHamburgerMenu/>}
          </div>
          <div className="nav-phone">
            <img src="/images/phone1-removebg-preview.png" alt="Phone icon" />
            <p>(021) 201 306</p>
          </div>
          <div className="nav-wha">
            <a
              target="_blank"
              rel="noopener noreferrer"
              href="https://api.whatsapp.com/send?phone=595981797434&text=Link%3A%0Ahttps%3A%2F%2Ffb.me%2F4HxUOzkRf%0A%0AHello%21+Can+I+get+more+info+on+this%3F&source_url=https%3A%2F%2Ffb.me%2F4HxUOzkRf&icebreaker=Hola%21+equipo+de+Exito+Repuestos%3F&app=facebook&entry_point=post_cta&jid=595981797434%40s.whatsapp.net&show_keyboard=1&show_ad_attribution=1&context=ARAn_7HcjUfaaDHcE7myPMMcGVDDqU17EgkMf2pvkCpxn-47DpupO8-kXUF2Ode5lEWNRaHYRVgJliHah5eYld-iyct7A0Fv4HLqcjTcKgAi9tHeY14f6U75RDRKKmewVuq4PL-NizWs87jV7km1W8gAMaRNBVfEDHmoxgaENzrXtJXvDKJXVBQY47SX8QLibSK9lzCsUBEI3eXZ_-XbvsSaMqKYevrXmD1wPoUf2DnYAv0S0eP4ZU8SPyoua-6o0wkMOpPQXGjMXnN47PsNkn35IJv6bu2Lol2S5H5iMtZHnj32-yj8ESDEHeTalcsPW5MBNjo&token=eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjEyNSJ9.eyJleHAiOjE3MjAwNjgzMTUsInBob25lIjoiNTk1OTgxNzk3NDM0IiwidGV4dCI6Ikxpbms6XG5odHRwczpcL1wvZmIubWVcLzRIeFVPemtSZlxuXG5IZWxsbyEgQ2FuIEkgZ2V0IG1vcmUgaW5mbyBvbiB0aGlzPyIsInNvdXJjZV91cmwiOiJodHRwczpcL1wvZmIubWVcLzRIeFVPemtSZiIsImljZWJyZWFrZXIiOiJIZWxsbyEgQ2FuIEkgZ2V0IG1vcmUgaW5mbyBvbiB0aGlzPyIsImFwcCI6ImZhY2Vib29rIiwiZW50cnlfcG9pbnQiOiJwb3N0X2N0YSIsImppZCI6IjU5NTk4MTc5NzQzNFx1MDA0MHMud2hhdHNhcHAubmV0Iiwic2hvd19rZXlib2FyZCI6MSwic2hvd19hZF9hdHRyaWJ1dGlvbiI6MX0.i3bNPz3szduEqT6vQ1ipUA_vfBbhSIWEWqZid1-FROTTibefofoOHxyK8d8prSupLIM7EWuv0RxvGteD-w-t9g"
              aria-label="WhatsApp link"
            >
              <img src="/images/wha1.png" alt="WhatsApp icon" />
            </a>
            <p>(0981) 797 434</p>
          </div>
          <div className="nav-face">
            <a
              target="_blank"
              rel="noopener noreferrer"
              href="https://www.facebook.com/p/Exito-Repuestos-Linea-Argentina-100064329181977/"
              aria-label="Exito Repuestos Facebook page"
            >
              <img src="/images/face1-removebg-preview.png" alt="Facebook icon" />
            </a>
            <p>Exito Repuestos Línea Argentina</p>
          </div>
          <div className="nav-gmail">
            <img src="/images/gmail1-removebg-preview.png" alt="Gmail icon" />
            <p>exitorepuestos2021@gmail.com</p>
          </div>
        </div>
      </nav>
      {hamburBtn ? <div className="navList">
        <ul>
          <li><Link to="/tienda">visitar tienda en línea <img style={{maxWidth:"3%"}} src="/images/tiendaEnLínea.png" alt="" /></Link></li>
        </ul>
      </div> : null}
    </header>
  );
};

export default Navbar;
