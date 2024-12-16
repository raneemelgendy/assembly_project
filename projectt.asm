
.model small

.stack 100h
  
  .data  
  wlcm db "welcome to our turkish airline online booking tickets $'"
  pmsg db "please enter your name and end your name with '.' $"
  
    nl db 0ah,0dh , '$'
   ans db 20 dup('$')
   greeting db " We are honored to serve you $"
   
   booking db  "The available everyday timetable to travel to Turkey is" ,0ah,0dh ,0ah,0dh ," 1) 7am , it's price is 100 Dollar" ,0ah,0dh ,0ah,0dh ," 2) 10am , it's price is 250 Dollar" ,0ah,0dh ,0ah,0dh ," 3) 5pm , it's price is 350 Dollar",0ah,0dh ,0ah,0dh ," 4) 8.30pm , it's price is 400 Dollar",0ah,0dh ,0ah,0dh ," 5) 12am , it's price is 300 Dollar",'$'
   choose db  "please choose The right time for you 1 ,2,3,4 or 5 $"
   
   
   endmsg7 db "You choose the time 7am with price 100 Dollar,we wish you enjoy in your flight.$"
   endmsg10 db "You choose the time 10am with price 250 Dollar,we wish you enjoy in your flight.$"
   endmsg5 db "You choose the time 5pm with price 350 Dollar,we wish you enjoy in your flight.$"
   endmsg8 db "You choose the time 8.30pm with price 400 Dollar,we wish you enjoy in your flight.$"
   msg db  "You choose the time 12am with price 300 Dollar,we wish you enjoy in your flight.$"
   
   .code 
   
   main proc far
    
    mov ax,@data
    mov ds,ax 
    
    ;welcome msg
     mov ah,09h
     lea dx,wlcm
    int 21h 
    
    ;print space  
     mov ah,09h
     lea dx,nl
     int 21h 
    
    ;print space  
     mov ah,09h
     lea dx,nl
     int 21h 
    
    ;print msg entername
    mov ah,09h
    lea dx,pmsg
    int 21h 
    
    ;rec name
    mov si,offset ans
    l1:
    mov ah ,01h
    int 21h
    mov [si] ,al 
    inc si 
    cmp al,'.'
    jne l1 
     
    ;print space  
     mov ah,09h
     lea dx,nl
     int 21h 
    
    ;print space  
     mov ah,09h
     lea dx,nl
     int 21h 
    
    ;print greeting msg
    
    mov ah,09h
    lea dx,greeting 
    int 21h  
            
    ;print name
    
    mov ah,09h
    lea dx,ans 
    int 21h

    
    ;print space  
     mov ah,09h
     lea dx,nl
     int 21h  
    
    ;print space  
     mov ah,09h
     lea dx,nl
     int 21h 
    
    
    ;print booking msg
    mov si ,offset booking
    lb:
     lea dx,[si]
    mov ah ,09h
    int 21h
    inc si
    cmp [si],'$'
    
    ;print space  
     mov ah,09h
     lea dx,nl
     int 21h 
   
     ;print space  
     mov ah,09h
     lea dx,nl
     int 21h 
    
    
    ;print choose msg
    
    mov ah ,09h
    lea dx,choose
    int 21h  
    
    ;rec val
    
    mov ah,01h 
    int 21h
    
   
    cmp al,'1'
    je l7
    cmp al,'2'
    je l10
    cmp al,'3'
    je l5
    cmp al,'4'
    je l8
    cmp al,'5'
    je l12
    
    l7:
     
     mov ah,09h
     lea dx,nl
     int 21h 
    
    lea dx,endmsg7
    mov ah,09h
    int 21h
    
    jmp exit

    l10:
    
     mov ah,09h
     lea dx,nl
     int 21h 
    
    lea dx,endmsg10
    mov ah,09h
    int 21h
    
    jmp exit
    
    
    
    l5:
     
    mov ah,09h
    lea dx,nl
    int 21h  
    
    lea dx,endmsg5
    mov ah,09h
    int 21h
    
    jmp exit
    
     l8:
     
    mov ah,09h
    lea dx,nl
    int 21h  
    
    lea dx,endmsg8
    mov ah,09h
    int 21h
    
    jmp exit
    
    l12:
     
    mov ah,09h
    lea dx,nl
    int 21h 
    
    lea dx,msg
    mov ah,09h
    int 21h 
    
    jmp exit
   
    
     
    
    exit:
     mov ah,004ch
     int 21h
  
  
 main endp
 end main
     
 
ret