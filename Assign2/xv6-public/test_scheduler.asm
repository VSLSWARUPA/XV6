
_test_scheduler:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"

int useless;

int
main(int argv, char* argc[]){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 38             	sub    $0x38,%esp

	if(argv<2){
  14:	83 39 01             	cmpl   $0x1,(%ecx)
main(int argv, char* argc[]){
  17:	8b 51 04             	mov    0x4(%ecx),%edx
	if(argv<2){
  1a:	7e 3a                	jle    56 <main+0x56>
		printf(1, "Incorrect format!\nFormat: test_scheduler <number of fork processes>\n");

		exit();
	}

	int n=atoi(argc[1]);
  1c:	83 ec 0c             	sub    $0xc,%esp
  1f:	ff 72 04             	push   0x4(%edx)
  22:	e8 f9 03 00 00       	call   420 <atoi>

	int burst_times[n];
  27:	83 c4 10             	add    $0x10,%esp
  2a:	8d 14 85 0f 00 00 00 	lea    0xf(,%eax,4),%edx
	int n=atoi(argc[1]);
  31:	89 c7                	mov    %eax,%edi
	int burst_times[n];
  33:	89 e1                	mov    %esp,%ecx
  35:	89 d0                	mov    %edx,%eax
  37:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  3d:	83 e0 f0             	and    $0xfffffff0,%eax
  40:	29 d1                	sub    %edx,%ecx
  42:	39 cc                	cmp    %ecx,%esp
  44:	74 23                	je     69 <main+0x69>
  46:	81 ec 00 10 00 00    	sub    $0x1000,%esp
  4c:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
  53:	00 
  54:	eb ec                	jmp    42 <main+0x42>
		printf(1, "Incorrect format!\nFormat: test_scheduler <number of fork processes>\n");
  56:	50                   	push   %eax
  57:	50                   	push   %eax
  58:	68 78 0b 00 00       	push   $0xb78
  5d:	6a 01                	push   $0x1
  5f:	e8 bc 05 00 00       	call   620 <printf>
		exit();
  64:	e8 2a 04 00 00       	call   493 <exit>
	int burst_times[n];
  69:	25 ff 0f 00 00       	and    $0xfff,%eax
  6e:	29 c4                	sub    %eax,%esp
  70:	85 c0                	test   %eax,%eax
  72:	74 05                	je     79 <main+0x79>
  74:	83 4c 04 fc 00       	orl    $0x0,-0x4(%esp,%eax,1)
  79:	89 65 c4             	mov    %esp,-0x3c(%ebp)

	for(int i=0;i<n;i++){
  7c:	85 ff                	test   %edi,%edi
  7e:	0f 8e e8 00 00 00    	jle    16c <main+0x16c>
  84:	31 db                	xor    %ebx,%ebx
		burst_times[i] = randomrange(1,20);
  86:	83 ec 08             	sub    $0x8,%esp
  89:	6a 14                	push   $0x14
  8b:	6a 01                	push   $0x1
  8d:	e8 9e 0a 00 00       	call   b30 <randomrange>
  92:	8b 75 c4             	mov    -0x3c(%ebp),%esi
	for(int i=0;i<n;i++){
  95:	83 c4 10             	add    $0x10,%esp
		burst_times[i] = randomrange(1,20);
  98:	89 04 9e             	mov    %eax,(%esi,%ebx,4)
	for(int i=0;i<n;i++){
  9b:	89 de                	mov    %ebx,%esi
  9d:	8d 5b 01             	lea    0x1(%ebx),%ebx
  a0:	39 df                	cmp    %ebx,%edi
  a2:	75 e2                	jne    86 <main+0x86>
	}

	printf(1, "\tPID \t Type \t Burst Time \t Context Switches\n");
  a4:	53                   	push   %ebx
  a5:	53                   	push   %ebx
  a6:	68 70 0c 00 00       	push   $0xc70
  ab:	6a 01                	push   $0x1
  ad:	e8 6e 05 00 00       	call   620 <printf>
	printf(1, "\t___ \t ____ \t __________ \t ________________\n\n");
  b2:	5f                   	pop    %edi
  b3:	58                   	pop    %eax
  b4:	68 a0 0c 00 00       	push   $0xca0
  b9:	6a 01                	push   $0x1
  bb:	31 ff                	xor    %edi,%edi
  bd:	e8 5e 05 00 00       	call   620 <printf>
  c2:	83 c4 10             	add    $0x10,%esp
  c5:	eb 0d                	jmp    d4 <main+0xd4>

	for(int i=0;i<n;i++){
  c7:	8d 47 01             	lea    0x1(%edi),%eax
  ca:	39 fe                	cmp    %edi,%esi
  cc:	0f 84 b9 00 00 00    	je     18b <main+0x18b>
  d2:	89 c7                	mov    %eax,%edi
		if(!fork()){
  d4:	e8 b2 03 00 00       	call   48b <fork>
  d9:	89 c3                	mov    %eax,%ebx
  db:	85 c0                	test   %eax,%eax
  dd:	75 e8                	jne    c7 <main+0xc7>

			if(i%2){
				// CPU Bound process
				set_burst_time(burst_times[i]);
  df:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  e2:	8b 04 b8             	mov    (%eax,%edi,4),%eax
			if(i%2){
  e5:	83 e7 01             	and    $0x1,%edi
  e8:	0f 84 b3 00 00 00    	je     1a1 <main+0x1a1>
				set_burst_time(burst_times[i]);
  ee:	83 ec 0c             	sub    $0xc,%esp

				int it=0;
				for(int j=0;j<100;j++){
  f1:	31 f6                	xor    %esi,%esi
				set_burst_time(burst_times[i]);
  f3:	50                   	push   %eax
  f4:	e8 52 04 00 00       	call   54b <set_burst_time>
  f9:	83 c4 10             	add    $0x10,%esp
  fc:	b9 40 42 0f 00       	mov    $0xf4240,%ecx
					for(int k=0;k<1000000;k++){
 101:	89 f0                	mov    %esi,%eax
 103:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 107:	90                   	nop
						if((j+k)%2)it++;
 108:	8d 53 01             	lea    0x1(%ebx),%edx
 10b:	83 eb 01             	sub    $0x1,%ebx
 10e:	a8 01                	test   $0x1,%al
 110:	0f 45 da             	cmovne %edx,%ebx
					for(int k=0;k<1000000;k++){
 113:	83 c0 01             	add    $0x1,%eax
 116:	39 c8                	cmp    %ecx,%eax
 118:	75 ee                	jne    108 <main+0x108>
				for(int j=0;j<100;j++){
 11a:	83 c6 01             	add    $0x1,%esi
 11d:	8d 48 01             	lea    0x1(%eax),%ecx
 120:	83 fe 64             	cmp    $0x64,%esi
 123:	75 dc                	jne    101 <main+0x101>
				useless+=it;


			
				struct processInfo info;
				getCurrentInfo(&info);
 125:	83 ec 0c             	sub    $0xc,%esp
 128:	8d 45 d0             	lea    -0x30(%ebp),%eax
				useless+=it;
 12b:	01 1d 80 10 00 00    	add    %ebx,0x1080
				getCurrentInfo(&info);
 131:	50                   	push   %eax
 132:	e8 24 04 00 00       	call   55b <getCurrentInfo>
				int bt = get_burst_time();
 137:	e8 17 04 00 00       	call   553 <get_burst_time>
				if(bt<10)
					printf(1, "\t%d \t CPU         %d                  %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 13c:	8b 75 d8             	mov    -0x28(%ebp),%esi
				if(bt<10)
 13f:	83 c4 10             	add    $0x10,%esp
				int bt = get_burst_time();
 142:	89 c3                	mov    %eax,%ebx
				if(bt<10)
 144:	83 f8 09             	cmp    $0x9,%eax
 147:	0f 8f b4 00 00 00    	jg     201 <main+0x201>
					printf(1, "\t%d \t CPU         %d                  %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 14d:	e8 11 04 00 00       	call   563 <getCurrentPID>
 152:	83 ec 0c             	sub    $0xc,%esp
 155:	56                   	push   %esi
 156:	53                   	push   %ebx
 157:	50                   	push   %eax
 158:	68 c0 0b 00 00       	push   $0xbc0
 15d:	6a 01                	push   $0x1
 15f:	e8 bc 04 00 00       	call   620 <printf>
 164:	83 c4 20             	add    $0x20,%esp
				else
					printf(1, "\t%d \t CPU         %d                 %d\n", getCurrentPID(), bt, info.numberContextSwitches);
				exit();	
 167:	e8 27 03 00 00       	call   493 <exit>
	printf(1, "\tPID \t Type \t Burst Time \t Context Switches\n");
 16c:	50                   	push   %eax
 16d:	50                   	push   %eax
 16e:	68 70 0c 00 00       	push   $0xc70
 173:	6a 01                	push   $0x1
 175:	e8 a6 04 00 00       	call   620 <printf>
	printf(1, "\t___ \t ____ \t __________ \t ________________\n\n");
 17a:	5a                   	pop    %edx
 17b:	59                   	pop    %ecx
 17c:	68 a0 0c 00 00       	push   $0xca0
 181:	6a 01                	push   $0x1
 183:	e8 98 04 00 00       	call   620 <printf>
 188:	83 c4 10             	add    $0x10,%esp

			}
		}
	}

	while(wait()!=-1);
 18b:	e8 0b 03 00 00       	call   49b <wait>
 190:	83 f8 ff             	cmp    $0xffffffff,%eax
 193:	74 d2                	je     167 <main+0x167>
 195:	e8 01 03 00 00       	call   49b <wait>
 19a:	83 f8 ff             	cmp    $0xffffffff,%eax
 19d:	75 ec                	jne    18b <main+0x18b>
 19f:	eb c6                	jmp    167 <main+0x167>
				set_burst_time(burst_times[i]);
 1a1:	83 ec 0c             	sub    $0xc,%esp
 1a4:	bb 64 00 00 00       	mov    $0x64,%ebx
 1a9:	50                   	push   %eax
 1aa:	e8 9c 03 00 00       	call   54b <set_burst_time>
 1af:	83 c4 10             	add    $0x10,%esp
					sleep(1);
 1b2:	83 ec 0c             	sub    $0xc,%esp
 1b5:	6a 01                	push   $0x1
 1b7:	e8 67 03 00 00       	call   523 <sleep>
				for(int i=0;i<100;i++){
 1bc:	83 c4 10             	add    $0x10,%esp
 1bf:	83 eb 01             	sub    $0x1,%ebx
 1c2:	75 ee                	jne    1b2 <main+0x1b2>
				getCurrentInfo(&info);
 1c4:	83 ec 0c             	sub    $0xc,%esp
 1c7:	8d 45 dc             	lea    -0x24(%ebp),%eax
 1ca:	50                   	push   %eax
 1cb:	e8 8b 03 00 00       	call   55b <getCurrentInfo>
				int bt = get_burst_time();
 1d0:	e8 7e 03 00 00       	call   553 <get_burst_time>
					printf(1, "\t%d \t I/O         %d                  %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 1d5:	8b 75 e4             	mov    -0x1c(%ebp),%esi
				if(bt<10)
 1d8:	83 c4 10             	add    $0x10,%esp
				int bt = get_burst_time();
 1db:	89 c3                	mov    %eax,%ebx
				if(bt<10)
 1dd:	83 f8 09             	cmp    $0x9,%eax
 1e0:	7f 3e                	jg     220 <main+0x220>
					printf(1, "\t%d \t I/O         %d                  %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 1e2:	e8 7c 03 00 00       	call   563 <getCurrentPID>
 1e7:	83 ec 0c             	sub    $0xc,%esp
 1ea:	56                   	push   %esi
 1eb:	53                   	push   %ebx
 1ec:	50                   	push   %eax
 1ed:	68 18 0c 00 00       	push   $0xc18
 1f2:	6a 01                	push   $0x1
 1f4:	e8 27 04 00 00       	call   620 <printf>
 1f9:	83 c4 20             	add    $0x20,%esp
 1fc:	e9 66 ff ff ff       	jmp    167 <main+0x167>
					printf(1, "\t%d \t CPU         %d                 %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 201:	e8 5d 03 00 00       	call   563 <getCurrentPID>
 206:	83 ec 0c             	sub    $0xc,%esp
 209:	56                   	push   %esi
 20a:	53                   	push   %ebx
 20b:	50                   	push   %eax
 20c:	68 ec 0b 00 00       	push   $0xbec
 211:	6a 01                	push   $0x1
 213:	e8 08 04 00 00       	call   620 <printf>
 218:	83 c4 20             	add    $0x20,%esp
 21b:	e9 47 ff ff ff       	jmp    167 <main+0x167>
					printf(1, "\t%d \t I/O         %d                 %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 220:	e8 3e 03 00 00       	call   563 <getCurrentPID>
 225:	83 ec 0c             	sub    $0xc,%esp
 228:	56                   	push   %esi
 229:	53                   	push   %ebx
 22a:	50                   	push   %eax
 22b:	68 44 0c 00 00       	push   $0xc44
 230:	6a 01                	push   $0x1
 232:	e8 e9 03 00 00       	call   620 <printf>
 237:	83 c4 20             	add    $0x20,%esp
 23a:	e9 28 ff ff ff       	jmp    167 <main+0x167>
 23f:	90                   	nop

00000240 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 240:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 241:	31 c0                	xor    %eax,%eax
{
 243:	89 e5                	mov    %esp,%ebp
 245:	53                   	push   %ebx
 246:	8b 4d 08             	mov    0x8(%ebp),%ecx
 249:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 250:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 254:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 257:	83 c0 01             	add    $0x1,%eax
 25a:	84 d2                	test   %dl,%dl
 25c:	75 f2                	jne    250 <strcpy+0x10>
    ;
  return os;
}
 25e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 261:	89 c8                	mov    %ecx,%eax
 263:	c9                   	leave  
 264:	c3                   	ret    
 265:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	53                   	push   %ebx
 274:	8b 55 08             	mov    0x8(%ebp),%edx
 277:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 27a:	0f b6 02             	movzbl (%edx),%eax
 27d:	84 c0                	test   %al,%al
 27f:	75 17                	jne    298 <strcmp+0x28>
 281:	eb 3a                	jmp    2bd <strcmp+0x4d>
 283:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 287:	90                   	nop
 288:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 28c:	83 c2 01             	add    $0x1,%edx
 28f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 292:	84 c0                	test   %al,%al
 294:	74 1a                	je     2b0 <strcmp+0x40>
    p++, q++;
 296:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 298:	0f b6 19             	movzbl (%ecx),%ebx
 29b:	38 c3                	cmp    %al,%bl
 29d:	74 e9                	je     288 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 29f:	29 d8                	sub    %ebx,%eax
}
 2a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2a4:	c9                   	leave  
 2a5:	c3                   	ret    
 2a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 2b0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 2b4:	31 c0                	xor    %eax,%eax
 2b6:	29 d8                	sub    %ebx,%eax
}
 2b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2bb:	c9                   	leave  
 2bc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 2bd:	0f b6 19             	movzbl (%ecx),%ebx
 2c0:	31 c0                	xor    %eax,%eax
 2c2:	eb db                	jmp    29f <strcmp+0x2f>
 2c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop

000002d0 <strlen>:

uint
strlen(const char *s)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 2d6:	80 3a 00             	cmpb   $0x0,(%edx)
 2d9:	74 15                	je     2f0 <strlen+0x20>
 2db:	31 c0                	xor    %eax,%eax
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
 2e0:	83 c0 01             	add    $0x1,%eax
 2e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 2e7:	89 c1                	mov    %eax,%ecx
 2e9:	75 f5                	jne    2e0 <strlen+0x10>
    ;
  return n;
}
 2eb:	89 c8                	mov    %ecx,%eax
 2ed:	5d                   	pop    %ebp
 2ee:	c3                   	ret    
 2ef:	90                   	nop
  for(n = 0; s[n]; n++)
 2f0:	31 c9                	xor    %ecx,%ecx
}
 2f2:	5d                   	pop    %ebp
 2f3:	89 c8                	mov    %ecx,%eax
 2f5:	c3                   	ret    
 2f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fd:	8d 76 00             	lea    0x0(%esi),%esi

00000300 <memset>:

void*
memset(void *dst, int c, uint n)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 307:	8b 4d 10             	mov    0x10(%ebp),%ecx
 30a:	8b 45 0c             	mov    0xc(%ebp),%eax
 30d:	89 d7                	mov    %edx,%edi
 30f:	fc                   	cld    
 310:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 312:	8b 7d fc             	mov    -0x4(%ebp),%edi
 315:	89 d0                	mov    %edx,%eax
 317:	c9                   	leave  
 318:	c3                   	ret    
 319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000320 <strchr>:

char*
strchr(const char *s, char c)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	8b 45 08             	mov    0x8(%ebp),%eax
 326:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 32a:	0f b6 10             	movzbl (%eax),%edx
 32d:	84 d2                	test   %dl,%dl
 32f:	75 12                	jne    343 <strchr+0x23>
 331:	eb 1d                	jmp    350 <strchr+0x30>
 333:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 337:	90                   	nop
 338:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 33c:	83 c0 01             	add    $0x1,%eax
 33f:	84 d2                	test   %dl,%dl
 341:	74 0d                	je     350 <strchr+0x30>
    if(*s == c)
 343:	38 d1                	cmp    %dl,%cl
 345:	75 f1                	jne    338 <strchr+0x18>
      return (char*)s;
  return 0;
}
 347:	5d                   	pop    %ebp
 348:	c3                   	ret    
 349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 350:	31 c0                	xor    %eax,%eax
}
 352:	5d                   	pop    %ebp
 353:	c3                   	ret    
 354:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop

00000360 <gets>:

char*
gets(char *buf, int max)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 365:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 368:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 369:	31 db                	xor    %ebx,%ebx
{
 36b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 36e:	eb 27                	jmp    397 <gets+0x37>
    cc = read(0, &c, 1);
 370:	83 ec 04             	sub    $0x4,%esp
 373:	6a 01                	push   $0x1
 375:	57                   	push   %edi
 376:	6a 00                	push   $0x0
 378:	e8 2e 01 00 00       	call   4ab <read>
    if(cc < 1)
 37d:	83 c4 10             	add    $0x10,%esp
 380:	85 c0                	test   %eax,%eax
 382:	7e 1d                	jle    3a1 <gets+0x41>
      break;
    buf[i++] = c;
 384:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 388:	8b 55 08             	mov    0x8(%ebp),%edx
 38b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 38f:	3c 0a                	cmp    $0xa,%al
 391:	74 1d                	je     3b0 <gets+0x50>
 393:	3c 0d                	cmp    $0xd,%al
 395:	74 19                	je     3b0 <gets+0x50>
  for(i=0; i+1 < max; ){
 397:	89 de                	mov    %ebx,%esi
 399:	83 c3 01             	add    $0x1,%ebx
 39c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 39f:	7c cf                	jl     370 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 3a1:	8b 45 08             	mov    0x8(%ebp),%eax
 3a4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 3a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ab:	5b                   	pop    %ebx
 3ac:	5e                   	pop    %esi
 3ad:	5f                   	pop    %edi
 3ae:	5d                   	pop    %ebp
 3af:	c3                   	ret    
  buf[i] = '\0';
 3b0:	8b 45 08             	mov    0x8(%ebp),%eax
 3b3:	89 de                	mov    %ebx,%esi
 3b5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 3b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3bc:	5b                   	pop    %ebx
 3bd:	5e                   	pop    %esi
 3be:	5f                   	pop    %edi
 3bf:	5d                   	pop    %ebp
 3c0:	c3                   	ret    
 3c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop

000003d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	56                   	push   %esi
 3d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3d5:	83 ec 08             	sub    $0x8,%esp
 3d8:	6a 00                	push   $0x0
 3da:	ff 75 08             	push   0x8(%ebp)
 3dd:	e8 f1 00 00 00       	call   4d3 <open>
  if(fd < 0)
 3e2:	83 c4 10             	add    $0x10,%esp
 3e5:	85 c0                	test   %eax,%eax
 3e7:	78 27                	js     410 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 3e9:	83 ec 08             	sub    $0x8,%esp
 3ec:	ff 75 0c             	push   0xc(%ebp)
 3ef:	89 c3                	mov    %eax,%ebx
 3f1:	50                   	push   %eax
 3f2:	e8 f4 00 00 00       	call   4eb <fstat>
  close(fd);
 3f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3fa:	89 c6                	mov    %eax,%esi
  close(fd);
 3fc:	e8 ba 00 00 00       	call   4bb <close>
  return r;
 401:	83 c4 10             	add    $0x10,%esp
}
 404:	8d 65 f8             	lea    -0x8(%ebp),%esp
 407:	89 f0                	mov    %esi,%eax
 409:	5b                   	pop    %ebx
 40a:	5e                   	pop    %esi
 40b:	5d                   	pop    %ebp
 40c:	c3                   	ret    
 40d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 410:	be ff ff ff ff       	mov    $0xffffffff,%esi
 415:	eb ed                	jmp    404 <stat+0x34>
 417:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41e:	66 90                	xchg   %ax,%ax

00000420 <atoi>:

int
atoi(const char *s)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	53                   	push   %ebx
 424:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 427:	0f be 02             	movsbl (%edx),%eax
 42a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 42d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 430:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 435:	77 1e                	ja     455 <atoi+0x35>
 437:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 440:	83 c2 01             	add    $0x1,%edx
 443:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 446:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 44a:	0f be 02             	movsbl (%edx),%eax
 44d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 450:	80 fb 09             	cmp    $0x9,%bl
 453:	76 eb                	jbe    440 <atoi+0x20>
  return n;
}
 455:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 458:	89 c8                	mov    %ecx,%eax
 45a:	c9                   	leave  
 45b:	c3                   	ret    
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000460 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	8b 45 10             	mov    0x10(%ebp),%eax
 467:	8b 55 08             	mov    0x8(%ebp),%edx
 46a:	56                   	push   %esi
 46b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 46e:	85 c0                	test   %eax,%eax
 470:	7e 13                	jle    485 <memmove+0x25>
 472:	01 d0                	add    %edx,%eax
  dst = vdst;
 474:	89 d7                	mov    %edx,%edi
 476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 480:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 481:	39 f8                	cmp    %edi,%eax
 483:	75 fb                	jne    480 <memmove+0x20>
  return vdst;
}
 485:	5e                   	pop    %esi
 486:	89 d0                	mov    %edx,%eax
 488:	5f                   	pop    %edi
 489:	5d                   	pop    %ebp
 48a:	c3                   	ret    

0000048b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 48b:	b8 01 00 00 00       	mov    $0x1,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <exit>:
SYSCALL(exit)
 493:	b8 02 00 00 00       	mov    $0x2,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <wait>:
SYSCALL(wait)
 49b:	b8 03 00 00 00       	mov    $0x3,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <pipe>:
SYSCALL(pipe)
 4a3:	b8 04 00 00 00       	mov    $0x4,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <read>:
SYSCALL(read)
 4ab:	b8 05 00 00 00       	mov    $0x5,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <write>:
SYSCALL(write)
 4b3:	b8 10 00 00 00       	mov    $0x10,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <close>:
SYSCALL(close)
 4bb:	b8 15 00 00 00       	mov    $0x15,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <kill>:
SYSCALL(kill)
 4c3:	b8 06 00 00 00       	mov    $0x6,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <exec>:
SYSCALL(exec)
 4cb:	b8 07 00 00 00       	mov    $0x7,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <open>:
SYSCALL(open)
 4d3:	b8 0f 00 00 00       	mov    $0xf,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <mknod>:
SYSCALL(mknod)
 4db:	b8 11 00 00 00       	mov    $0x11,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <unlink>:
SYSCALL(unlink)
 4e3:	b8 12 00 00 00       	mov    $0x12,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <fstat>:
SYSCALL(fstat)
 4eb:	b8 08 00 00 00       	mov    $0x8,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <link>:
SYSCALL(link)
 4f3:	b8 13 00 00 00       	mov    $0x13,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <mkdir>:
SYSCALL(mkdir)
 4fb:	b8 14 00 00 00       	mov    $0x14,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <chdir>:
SYSCALL(chdir)
 503:	b8 09 00 00 00       	mov    $0x9,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <dup>:
SYSCALL(dup)
 50b:	b8 0a 00 00 00       	mov    $0xa,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <getpid>:
SYSCALL(getpid)
 513:	b8 0b 00 00 00       	mov    $0xb,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <sbrk>:
SYSCALL(sbrk)
 51b:	b8 0c 00 00 00       	mov    $0xc,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <sleep>:
SYSCALL(sleep)
 523:	b8 0d 00 00 00       	mov    $0xd,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <uptime>:
SYSCALL(uptime)
 52b:	b8 0e 00 00 00       	mov    $0xe,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <getNumProc>:
SYSCALL(getNumProc)
 533:	b8 16 00 00 00       	mov    $0x16,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <getMaxPID>:
SYSCALL(getMaxPID)
 53b:	b8 17 00 00 00       	mov    $0x17,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <getProcInfo>:
SYSCALL(getProcInfo)
 543:	b8 18 00 00 00       	mov    $0x18,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <set_burst_time>:
SYSCALL(set_burst_time)
 54b:	b8 19 00 00 00       	mov    $0x19,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <get_burst_time>:
SYSCALL(get_burst_time)
 553:	b8 1a 00 00 00       	mov    $0x1a,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <getCurrentInfo>:
SYSCALL(getCurrentInfo)
 55b:	b8 1c 00 00 00       	mov    $0x1c,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <getCurrentPID>:
 563:	b8 1d 00 00 00       	mov    $0x1d,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    
 56b:	66 90                	xchg   %ax,%ax
 56d:	66 90                	xchg   %ax,%ax
 56f:	90                   	nop

00000570 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
 575:	53                   	push   %ebx
 576:	83 ec 3c             	sub    $0x3c,%esp
 579:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 57c:	89 d1                	mov    %edx,%ecx
{
 57e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 581:	85 d2                	test   %edx,%edx
 583:	0f 89 7f 00 00 00    	jns    608 <printint+0x98>
 589:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 58d:	74 79                	je     608 <printint+0x98>
    neg = 1;
 58f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 596:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 598:	31 db                	xor    %ebx,%ebx
 59a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 59d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5a0:	89 c8                	mov    %ecx,%eax
 5a2:	31 d2                	xor    %edx,%edx
 5a4:	89 cf                	mov    %ecx,%edi
 5a6:	f7 75 c4             	divl   -0x3c(%ebp)
 5a9:	0f b6 92 30 0d 00 00 	movzbl 0xd30(%edx),%edx
 5b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5b3:	89 d8                	mov    %ebx,%eax
 5b5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5b8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5bb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5be:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5c1:	76 dd                	jbe    5a0 <printint+0x30>
  if(neg)
 5c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5c6:	85 c9                	test   %ecx,%ecx
 5c8:	74 0c                	je     5d6 <printint+0x66>
    buf[i++] = '-';
 5ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5cf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5d1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5d6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5d9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5dd:	eb 07                	jmp    5e6 <printint+0x76>
 5df:	90                   	nop
    putc(fd, buf[i]);
 5e0:	0f b6 13             	movzbl (%ebx),%edx
 5e3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5e6:	83 ec 04             	sub    $0x4,%esp
 5e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5ec:	6a 01                	push   $0x1
 5ee:	56                   	push   %esi
 5ef:	57                   	push   %edi
 5f0:	e8 be fe ff ff       	call   4b3 <write>
  while(--i >= 0)
 5f5:	83 c4 10             	add    $0x10,%esp
 5f8:	39 de                	cmp    %ebx,%esi
 5fa:	75 e4                	jne    5e0 <printint+0x70>
}
 5fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ff:	5b                   	pop    %ebx
 600:	5e                   	pop    %esi
 601:	5f                   	pop    %edi
 602:	5d                   	pop    %ebp
 603:	c3                   	ret    
 604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 608:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 60f:	eb 87                	jmp    598 <printint+0x28>
 611:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 618:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61f:	90                   	nop

00000620 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	57                   	push   %edi
 624:	56                   	push   %esi
 625:	53                   	push   %ebx
 626:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 629:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 62c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 62f:	0f b6 13             	movzbl (%ebx),%edx
 632:	84 d2                	test   %dl,%dl
 634:	74 6a                	je     6a0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 636:	8d 45 10             	lea    0x10(%ebp),%eax
 639:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 63c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 63f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 641:	89 45 d0             	mov    %eax,-0x30(%ebp)
 644:	eb 36                	jmp    67c <printf+0x5c>
 646:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64d:	8d 76 00             	lea    0x0(%esi),%esi
 650:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 653:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 658:	83 f8 25             	cmp    $0x25,%eax
 65b:	74 15                	je     672 <printf+0x52>
  write(fd, &c, 1);
 65d:	83 ec 04             	sub    $0x4,%esp
 660:	88 55 e7             	mov    %dl,-0x19(%ebp)
 663:	6a 01                	push   $0x1
 665:	57                   	push   %edi
 666:	56                   	push   %esi
 667:	e8 47 fe ff ff       	call   4b3 <write>
 66c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 66f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 672:	0f b6 13             	movzbl (%ebx),%edx
 675:	83 c3 01             	add    $0x1,%ebx
 678:	84 d2                	test   %dl,%dl
 67a:	74 24                	je     6a0 <printf+0x80>
    c = fmt[i] & 0xff;
 67c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 67f:	85 c9                	test   %ecx,%ecx
 681:	74 cd                	je     650 <printf+0x30>
      }
    } else if(state == '%'){
 683:	83 f9 25             	cmp    $0x25,%ecx
 686:	75 ea                	jne    672 <printf+0x52>
      if(c == 'd'){
 688:	83 f8 25             	cmp    $0x25,%eax
 68b:	0f 84 07 01 00 00    	je     798 <printf+0x178>
 691:	83 e8 63             	sub    $0x63,%eax
 694:	83 f8 15             	cmp    $0x15,%eax
 697:	77 17                	ja     6b0 <printf+0x90>
 699:	ff 24 85 d8 0c 00 00 	jmp    *0xcd8(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6a3:	5b                   	pop    %ebx
 6a4:	5e                   	pop    %esi
 6a5:	5f                   	pop    %edi
 6a6:	5d                   	pop    %ebp
 6a7:	c3                   	ret    
 6a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6af:	90                   	nop
  write(fd, &c, 1);
 6b0:	83 ec 04             	sub    $0x4,%esp
 6b3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 6b6:	6a 01                	push   $0x1
 6b8:	57                   	push   %edi
 6b9:	56                   	push   %esi
 6ba:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6be:	e8 f0 fd ff ff       	call   4b3 <write>
        putc(fd, c);
 6c3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 6c7:	83 c4 0c             	add    $0xc,%esp
 6ca:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6cd:	6a 01                	push   $0x1
 6cf:	57                   	push   %edi
 6d0:	56                   	push   %esi
 6d1:	e8 dd fd ff ff       	call   4b3 <write>
        putc(fd, c);
 6d6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6d9:	31 c9                	xor    %ecx,%ecx
 6db:	eb 95                	jmp    672 <printf+0x52>
 6dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 6e0:	83 ec 0c             	sub    $0xc,%esp
 6e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6e8:	6a 00                	push   $0x0
 6ea:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6ed:	8b 10                	mov    (%eax),%edx
 6ef:	89 f0                	mov    %esi,%eax
 6f1:	e8 7a fe ff ff       	call   570 <printint>
        ap++;
 6f6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6fa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6fd:	31 c9                	xor    %ecx,%ecx
 6ff:	e9 6e ff ff ff       	jmp    672 <printf+0x52>
 704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 708:	8b 45 d0             	mov    -0x30(%ebp),%eax
 70b:	8b 10                	mov    (%eax),%edx
        ap++;
 70d:	83 c0 04             	add    $0x4,%eax
 710:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 713:	85 d2                	test   %edx,%edx
 715:	0f 84 8d 00 00 00    	je     7a8 <printf+0x188>
        while(*s != 0){
 71b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 71e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 720:	84 c0                	test   %al,%al
 722:	0f 84 4a ff ff ff    	je     672 <printf+0x52>
 728:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 72b:	89 d3                	mov    %edx,%ebx
 72d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 730:	83 ec 04             	sub    $0x4,%esp
          s++;
 733:	83 c3 01             	add    $0x1,%ebx
 736:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 739:	6a 01                	push   $0x1
 73b:	57                   	push   %edi
 73c:	56                   	push   %esi
 73d:	e8 71 fd ff ff       	call   4b3 <write>
        while(*s != 0){
 742:	0f b6 03             	movzbl (%ebx),%eax
 745:	83 c4 10             	add    $0x10,%esp
 748:	84 c0                	test   %al,%al
 74a:	75 e4                	jne    730 <printf+0x110>
      state = 0;
 74c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 74f:	31 c9                	xor    %ecx,%ecx
 751:	e9 1c ff ff ff       	jmp    672 <printf+0x52>
 756:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 75d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 760:	83 ec 0c             	sub    $0xc,%esp
 763:	b9 0a 00 00 00       	mov    $0xa,%ecx
 768:	6a 01                	push   $0x1
 76a:	e9 7b ff ff ff       	jmp    6ea <printf+0xca>
 76f:	90                   	nop
        putc(fd, *ap);
 770:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 773:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 776:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 778:	6a 01                	push   $0x1
 77a:	57                   	push   %edi
 77b:	56                   	push   %esi
        putc(fd, *ap);
 77c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 77f:	e8 2f fd ff ff       	call   4b3 <write>
        ap++;
 784:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 788:	83 c4 10             	add    $0x10,%esp
      state = 0;
 78b:	31 c9                	xor    %ecx,%ecx
 78d:	e9 e0 fe ff ff       	jmp    672 <printf+0x52>
 792:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 798:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 79b:	83 ec 04             	sub    $0x4,%esp
 79e:	e9 2a ff ff ff       	jmp    6cd <printf+0xad>
 7a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7a7:	90                   	nop
          s = "(null)";
 7a8:	ba ce 0c 00 00       	mov    $0xcce,%edx
        while(*s != 0){
 7ad:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 7b0:	b8 28 00 00 00       	mov    $0x28,%eax
 7b5:	89 d3                	mov    %edx,%ebx
 7b7:	e9 74 ff ff ff       	jmp    730 <printf+0x110>
 7bc:	66 90                	xchg   %ax,%ax
 7be:	66 90                	xchg   %ax,%ax

000007c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c1:	a1 84 10 00 00       	mov    0x1084,%eax
{
 7c6:	89 e5                	mov    %esp,%ebp
 7c8:	57                   	push   %edi
 7c9:	56                   	push   %esi
 7ca:	53                   	push   %ebx
 7cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 7ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7d8:	89 c2                	mov    %eax,%edx
 7da:	8b 00                	mov    (%eax),%eax
 7dc:	39 ca                	cmp    %ecx,%edx
 7de:	73 30                	jae    810 <free+0x50>
 7e0:	39 c1                	cmp    %eax,%ecx
 7e2:	72 04                	jb     7e8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e4:	39 c2                	cmp    %eax,%edx
 7e6:	72 f0                	jb     7d8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ee:	39 f8                	cmp    %edi,%eax
 7f0:	74 30                	je     822 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7f2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7f5:	8b 42 04             	mov    0x4(%edx),%eax
 7f8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7fb:	39 f1                	cmp    %esi,%ecx
 7fd:	74 3a                	je     839 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7ff:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 801:	5b                   	pop    %ebx
  freep = p;
 802:	89 15 84 10 00 00    	mov    %edx,0x1084
}
 808:	5e                   	pop    %esi
 809:	5f                   	pop    %edi
 80a:	5d                   	pop    %ebp
 80b:	c3                   	ret    
 80c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 810:	39 c2                	cmp    %eax,%edx
 812:	72 c4                	jb     7d8 <free+0x18>
 814:	39 c1                	cmp    %eax,%ecx
 816:	73 c0                	jae    7d8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 818:	8b 73 fc             	mov    -0x4(%ebx),%esi
 81b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 81e:	39 f8                	cmp    %edi,%eax
 820:	75 d0                	jne    7f2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 822:	03 70 04             	add    0x4(%eax),%esi
 825:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 828:	8b 02                	mov    (%edx),%eax
 82a:	8b 00                	mov    (%eax),%eax
 82c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 82f:	8b 42 04             	mov    0x4(%edx),%eax
 832:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 835:	39 f1                	cmp    %esi,%ecx
 837:	75 c6                	jne    7ff <free+0x3f>
    p->s.size += bp->s.size;
 839:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 83c:	89 15 84 10 00 00    	mov    %edx,0x1084
    p->s.size += bp->s.size;
 842:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 845:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 848:	89 0a                	mov    %ecx,(%edx)
}
 84a:	5b                   	pop    %ebx
 84b:	5e                   	pop    %esi
 84c:	5f                   	pop    %edi
 84d:	5d                   	pop    %ebp
 84e:	c3                   	ret    
 84f:	90                   	nop

00000850 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	57                   	push   %edi
 854:	56                   	push   %esi
 855:	53                   	push   %ebx
 856:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 859:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 85c:	8b 3d 84 10 00 00    	mov    0x1084,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 862:	8d 70 07             	lea    0x7(%eax),%esi
 865:	c1 ee 03             	shr    $0x3,%esi
 868:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 86b:	85 ff                	test   %edi,%edi
 86d:	0f 84 9d 00 00 00    	je     910 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 873:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 875:	8b 4a 04             	mov    0x4(%edx),%ecx
 878:	39 f1                	cmp    %esi,%ecx
 87a:	73 6a                	jae    8e6 <malloc+0x96>
 87c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 881:	39 de                	cmp    %ebx,%esi
 883:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 886:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 88d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 890:	eb 17                	jmp    8a9 <malloc+0x59>
 892:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 898:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 89a:	8b 48 04             	mov    0x4(%eax),%ecx
 89d:	39 f1                	cmp    %esi,%ecx
 89f:	73 4f                	jae    8f0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8a1:	8b 3d 84 10 00 00    	mov    0x1084,%edi
 8a7:	89 c2                	mov    %eax,%edx
 8a9:	39 d7                	cmp    %edx,%edi
 8ab:	75 eb                	jne    898 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 8ad:	83 ec 0c             	sub    $0xc,%esp
 8b0:	ff 75 e4             	push   -0x1c(%ebp)
 8b3:	e8 63 fc ff ff       	call   51b <sbrk>
  if(p == (char*)-1)
 8b8:	83 c4 10             	add    $0x10,%esp
 8bb:	83 f8 ff             	cmp    $0xffffffff,%eax
 8be:	74 1c                	je     8dc <malloc+0x8c>
  hp->s.size = nu;
 8c0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8c3:	83 ec 0c             	sub    $0xc,%esp
 8c6:	83 c0 08             	add    $0x8,%eax
 8c9:	50                   	push   %eax
 8ca:	e8 f1 fe ff ff       	call   7c0 <free>
  return freep;
 8cf:	8b 15 84 10 00 00    	mov    0x1084,%edx
      if((p = morecore(nunits)) == 0)
 8d5:	83 c4 10             	add    $0x10,%esp
 8d8:	85 d2                	test   %edx,%edx
 8da:	75 bc                	jne    898 <malloc+0x48>
        return 0;
  }
}
 8dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8df:	31 c0                	xor    %eax,%eax
}
 8e1:	5b                   	pop    %ebx
 8e2:	5e                   	pop    %esi
 8e3:	5f                   	pop    %edi
 8e4:	5d                   	pop    %ebp
 8e5:	c3                   	ret    
    if(p->s.size >= nunits){
 8e6:	89 d0                	mov    %edx,%eax
 8e8:	89 fa                	mov    %edi,%edx
 8ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8f0:	39 ce                	cmp    %ecx,%esi
 8f2:	74 4c                	je     940 <malloc+0xf0>
        p->s.size -= nunits;
 8f4:	29 f1                	sub    %esi,%ecx
 8f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8fc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8ff:	89 15 84 10 00 00    	mov    %edx,0x1084
}
 905:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 908:	83 c0 08             	add    $0x8,%eax
}
 90b:	5b                   	pop    %ebx
 90c:	5e                   	pop    %esi
 90d:	5f                   	pop    %edi
 90e:	5d                   	pop    %ebp
 90f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 910:	c7 05 84 10 00 00 88 	movl   $0x1088,0x1084
 917:	10 00 00 
    base.s.size = 0;
 91a:	bf 88 10 00 00       	mov    $0x1088,%edi
    base.s.ptr = freep = prevp = &base;
 91f:	c7 05 88 10 00 00 88 	movl   $0x1088,0x1088
 926:	10 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 929:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 92b:	c7 05 8c 10 00 00 00 	movl   $0x0,0x108c
 932:	00 00 00 
    if(p->s.size >= nunits){
 935:	e9 42 ff ff ff       	jmp    87c <malloc+0x2c>
 93a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 940:	8b 08                	mov    (%eax),%ecx
 942:	89 0a                	mov    %ecx,(%edx)
 944:	eb b9                	jmp    8ff <malloc+0xaf>
 946:	66 90                	xchg   %ax,%ax
 948:	66 90                	xchg   %ax,%ax
 94a:	66 90                	xchg   %ax,%ax
 94c:	66 90                	xchg   %ax,%ax
 94e:	66 90                	xchg   %ax,%ax

00000950 <sgenrand>:
static int mti=N+1; /* mti==N+1 means mt[N] is not initialized */

/* initializing the array with a NONZERO seed */
void
sgenrand(unsigned long seed)
{
 950:	55                   	push   %ebp
 951:	b8 a4 10 00 00       	mov    $0x10a4,%eax
 956:	89 e5                	mov    %esp,%ebp
 958:	8b 55 08             	mov    0x8(%ebp),%edx
    /* setting initial seeds to mt[N] using         */
    /* the generator Line 25 of Table 1 in          */
    /* [KNUTH 1981, The Art of Computer Programming */
    /*    Vol. 2 (2nd Ed.), pp102]                  */
    mt[0]= seed & 0xffffffff;
 95b:	89 15 a0 10 00 00    	mov    %edx,0x10a0
    for (mti=1; mti<N; mti++)
 961:	eb 08                	jmp    96b <sgenrand+0x1b>
 963:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 967:	90                   	nop
 968:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 96b:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
 971:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
 973:	3d 5c 1a 00 00       	cmp    $0x1a5c,%eax
 978:	75 ee                	jne    968 <sgenrand+0x18>
 97a:	c7 05 74 10 00 00 70 	movl   $0x270,0x1074
 981:	02 00 00 
}
 984:	5d                   	pop    %ebp
 985:	c3                   	ret    
 986:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 98d:	8d 76 00             	lea    0x0(%esi),%esi

00000990 <genrand>:
{
    unsigned long y;
    static unsigned long mag01[2]={0x0, MATRIX_A};
    /* mag01[x] = x * MATRIX_A  for x=0,1 */

    if (mti >= N) { /* generate N words at one time */
 990:	a1 74 10 00 00       	mov    0x1074,%eax
 995:	3d 6f 02 00 00       	cmp    $0x26f,%eax
 99a:	7f 3d                	jg     9d9 <genrand+0x49>
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];

        mti = 0;
    }
  
    y = mt[mti++];
 99c:	8b 0c 85 a0 10 00 00 	mov    0x10a0(,%eax,4),%ecx
 9a3:	8d 50 01             	lea    0x1(%eax),%edx
 9a6:	89 15 74 10 00 00    	mov    %edx,0x1074
    y ^= TEMPERING_SHIFT_U(y);
 9ac:	89 ca                	mov    %ecx,%edx
 9ae:	c1 ea 0b             	shr    $0xb,%edx
 9b1:	31 ca                	xor    %ecx,%edx
    y ^= TEMPERING_SHIFT_S(y) & TEMPERING_MASK_B;
 9b3:	89 d0                	mov    %edx,%eax
 9b5:	c1 e0 07             	shl    $0x7,%eax
 9b8:	25 80 56 2c 9d       	and    $0x9d2c5680,%eax
 9bd:	31 d0                	xor    %edx,%eax
    y ^= TEMPERING_SHIFT_T(y) & TEMPERING_MASK_C;
 9bf:	89 c2                	mov    %eax,%edx
 9c1:	c1 e2 0f             	shl    $0xf,%edx
 9c4:	81 e2 00 00 c6 ef    	and    $0xefc60000,%edx
 9ca:	31 c2                	xor    %eax,%edx
    y ^= TEMPERING_SHIFT_L(y);
 9cc:	89 d0                	mov    %edx,%eax
 9ce:	c1 e8 12             	shr    $0x12,%eax
 9d1:	31 d0                	xor    %edx,%eax

    // Strip off uppermost bit because we want a long,
    // not an unsigned long
    return y & RAND_MAX;
 9d3:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
 9d8:	c3                   	ret    
        if (mti == N+1)   /* if sgenrand() has not been called, */
 9d9:	3d 71 02 00 00       	cmp    $0x271,%eax
 9de:	0f 84 d4 00 00 00    	je     ab8 <genrand+0x128>
    mt[0]= seed & 0xffffffff;
 9e4:	31 c0                	xor    %eax,%eax
 9e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9ed:	8d 76 00             	lea    0x0(%esi),%esi
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
 9f0:	8b 0c 85 a0 10 00 00 	mov    0x10a0(,%eax,4),%ecx
 9f7:	83 c0 01             	add    $0x1,%eax
 9fa:	8b 14 85 a0 10 00 00 	mov    0x10a0(,%eax,4),%edx
 a01:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
 a07:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 a0d:	09 ca                	or     %ecx,%edx
            mt[kk] = mt[kk+M] ^ (y >> 1) ^ mag01[y & 0x1];
 a0f:	89 d1                	mov    %edx,%ecx
 a11:	83 e2 01             	and    $0x1,%edx
 a14:	d1 e9                	shr    %ecx
 a16:	33 0c 85 d0 16 00 00 	xor    0x16d0(,%eax,4),%ecx
 a1d:	33 0c 95 44 0d 00 00 	xor    0xd44(,%edx,4),%ecx
 a24:	89 0c 85 9c 10 00 00 	mov    %ecx,0x109c(,%eax,4)
        for (kk=0;kk<N-M;kk++) {
 a2b:	3d e3 00 00 00       	cmp    $0xe3,%eax
 a30:	75 be                	jne    9f0 <genrand+0x60>
 a32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
 a38:	8b 0c 85 a0 10 00 00 	mov    0x10a0(,%eax,4),%ecx
 a3f:	83 c0 01             	add    $0x1,%eax
 a42:	8b 14 85 a0 10 00 00 	mov    0x10a0(,%eax,4),%edx
 a49:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
 a4f:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 a55:	09 ca                	or     %ecx,%edx
            mt[kk] = mt[kk+(M-N)] ^ (y >> 1) ^ mag01[y & 0x1];
 a57:	89 d1                	mov    %edx,%ecx
 a59:	83 e2 01             	and    $0x1,%edx
 a5c:	d1 e9                	shr    %ecx
 a5e:	33 0c 85 10 0d 00 00 	xor    0xd10(,%eax,4),%ecx
 a65:	33 0c 95 44 0d 00 00 	xor    0xd44(,%edx,4),%ecx
 a6c:	89 0c 85 9c 10 00 00 	mov    %ecx,0x109c(,%eax,4)
        for (;kk<N-1;kk++) {
 a73:	3d 6f 02 00 00       	cmp    $0x26f,%eax
 a78:	75 be                	jne    a38 <genrand+0xa8>
        y = (mt[N-1]&UPPER_MASK)|(mt[0]&LOWER_MASK);
 a7a:	8b 0d a0 10 00 00    	mov    0x10a0,%ecx
 a80:	a1 5c 1a 00 00       	mov    0x1a5c,%eax
 a85:	89 ca                	mov    %ecx,%edx
 a87:	25 00 00 00 80       	and    $0x80000000,%eax
 a8c:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 a92:	09 d0                	or     %edx,%eax
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];
 a94:	89 c2                	mov    %eax,%edx
 a96:	83 e0 01             	and    $0x1,%eax
 a99:	d1 ea                	shr    %edx
 a9b:	33 15 d0 16 00 00    	xor    0x16d0,%edx
 aa1:	33 14 85 44 0d 00 00 	xor    0xd44(,%eax,4),%edx
 aa8:	89 15 5c 1a 00 00    	mov    %edx,0x1a5c
 aae:	ba 01 00 00 00       	mov    $0x1,%edx
 ab3:	e9 ee fe ff ff       	jmp    9a6 <genrand+0x16>
    mt[0]= seed & 0xffffffff;
 ab8:	b8 a4 10 00 00       	mov    $0x10a4,%eax
 abd:	b9 5c 1a 00 00       	mov    $0x1a5c,%ecx
 ac2:	ba 05 11 00 00       	mov    $0x1105,%edx
 ac7:	c7 05 a0 10 00 00 05 	movl   $0x1105,0x10a0
 ace:	11 00 00 
    for (mti=1; mti<N; mti++)
 ad1:	eb 08                	jmp    adb <genrand+0x14b>
 ad3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 ad7:	90                   	nop
 ad8:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 adb:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
 ae1:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
 ae3:	39 c1                	cmp    %eax,%ecx
 ae5:	75 f1                	jne    ad8 <genrand+0x148>
 ae7:	e9 f8 fe ff ff       	jmp    9e4 <genrand+0x54>
 aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000af0 <random_at_most>:

// Assumes 0 <= max <= RAND_MAX
// Returns in the half-open interval [0, max]
long random_at_most(long max) {
 af0:	55                   	push   %ebp
  unsigned long
    // max <= RAND_MAX < ULONG_MAX, so this is okay.
    num_bins = (unsigned long) max + 1,
    num_rand = (unsigned long) RAND_MAX + 1,
    bin_size = num_rand / num_bins,
 af1:	31 d2                	xor    %edx,%edx
long random_at_most(long max) {
 af3:	89 e5                	mov    %esp,%ebp
 af5:	56                   	push   %esi
    num_bins = (unsigned long) max + 1,
 af6:	8b 45 08             	mov    0x8(%ebp),%eax
long random_at_most(long max) {
 af9:	53                   	push   %ebx
    bin_size = num_rand / num_bins,
 afa:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    num_bins = (unsigned long) max + 1,
 aff:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
 b02:	89 d8                	mov    %ebx,%eax
 b04:	f7 f1                	div    %ecx
 b06:	89 c6                	mov    %eax,%esi
  long x;
  do {
   x = genrand();
  }
  // This is carefully written not to overflow
  while (num_rand - defect <= (unsigned long)x);
 b08:	29 d3                	sub    %edx,%ebx
 b0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   x = genrand();
 b10:	e8 7b fe ff ff       	call   990 <genrand>
  while (num_rand - defect <= (unsigned long)x);
 b15:	39 d8                	cmp    %ebx,%eax
 b17:	73 f7                	jae    b10 <random_at_most+0x20>

  // Truncated division is intentional
  return x/bin_size;
 b19:	31 d2                	xor    %edx,%edx
}
 b1b:	5b                   	pop    %ebx
  return x/bin_size;
 b1c:	f7 f6                	div    %esi
}
 b1e:	5e                   	pop    %esi
 b1f:	5d                   	pop    %ebp
 b20:	c3                   	ret    
 b21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b28:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b2f:	90                   	nop

00000b30 <randomrange>:

int randomrange(int low, int high){
 b30:	55                   	push   %ebp
 b31:	89 e5                	mov    %esp,%ebp
 b33:	57                   	push   %edi
 b34:	56                   	push   %esi
 b35:	53                   	push   %ebx
 b36:	83 ec 0c             	sub    $0xc,%esp
 b39:	8b 75 08             	mov    0x8(%ebp),%esi
 b3c:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(high<low){
 b3f:	39 f0                	cmp    %esi,%eax
 b41:	7d 06                	jge    b49 <randomrange+0x19>
 b43:	89 f2                	mov    %esi,%edx
 b45:	89 c6                	mov    %eax,%esi
 b47:	89 d0                	mov    %edx,%eax
    int temp=high;
    high=low;
    low=temp;
  }
  int val = random_at_most(high-low) + low;
 b49:	29 f0                	sub    %esi,%eax
    bin_size = num_rand / num_bins,
 b4b:	bb 00 00 00 80       	mov    $0x80000000,%ebx
 b50:	31 d2                	xor    %edx,%edx
    num_bins = (unsigned long) max + 1,
 b52:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
 b55:	89 d8                	mov    %ebx,%eax
 b57:	f7 f1                	div    %ecx
 b59:	89 c7                	mov    %eax,%edi
  while (num_rand - defect <= (unsigned long)x);
 b5b:	29 d3                	sub    %edx,%ebx
 b5d:	8d 76 00             	lea    0x0(%esi),%esi
   x = genrand();
 b60:	e8 2b fe ff ff       	call   990 <genrand>
  while (num_rand - defect <= (unsigned long)x);
 b65:	39 d8                	cmp    %ebx,%eax
 b67:	73 f7                	jae    b60 <randomrange+0x30>
  return x/bin_size;
 b69:	31 d2                	xor    %edx,%edx
  return val;
}
 b6b:	83 c4 0c             	add    $0xc,%esp
  return x/bin_size;
 b6e:	f7 f7                	div    %edi
}
 b70:	5b                   	pop    %ebx
  int val = random_at_most(high-low) + low;
 b71:	01 f0                	add    %esi,%eax
}
 b73:	5e                   	pop    %esi
 b74:	5f                   	pop    %edi
 b75:	5d                   	pop    %ebp
 b76:	c3                   	ret    
