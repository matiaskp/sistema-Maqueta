import React,{useState} from 'react'
import { RxHamburgerMenu } from "react-icons/rx";

const NewNav = () => {
    const [hamburBtn,setHamburBtn] = useState(false)
  return (
    <header>
        <nav>
            <RxHamburgerMenu/>
            <ul>
                <li></li>
            </ul>
        </nav>
    </header>
  )
}

export default NewNav

