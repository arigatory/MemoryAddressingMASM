.386
.model flat,c

.const

;int FibVals[] = { 0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610 };
FibVals dword 0,1,1,2,3,5,8,13,21
		dword 34,55,89,144,233,377,610

;NumFibVals = sizeof(FibVals)/ sizeof(int);
NumFibVals = dword($-FibVals)/sizeof dword

PUBLIC	NumFibVals

.code
MemoryAddressing proc
	push ebp
	mov ebp,esp
	push ebx
	push esi
	push edi

	xor eax,eax
	mov ecx,[ebp+8]		;ecx = i
	cmp ecx,0
	jl InvalidIndex
	cmp ecx,[NumFibVals]
	jg InvalidIndex

;eg1 - base register
	mov ebx, offset FibVals	;ebx = FibVals
	mov esi,[ebp+8]			;esi = i
	shl esi,2				;esi = i*4
	add ebx,esi				;ebx = FibVals+i*4
	mov eax,[ebx]
	mov edi,[ebp+12]
	mov [edi],eax


endp MemoryAddressing
end