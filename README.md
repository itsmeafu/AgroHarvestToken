# Agro Harvest Token (AHT)

## Proje Amaçları

Agro Harvest Token (AHT), tarım sektörüne yönelik bir blok zinciri uygulamasıdır. Bu proje, çiftçilere ve yatırımcılara gelir dağıtım sistemi sunarak tarımsal ürünlerin hareketini takip etmeyi, şeffaflığı artırmayı, aracı kurumlara gerek kalmadan sermaye arttırmayı ve kar dağıtımını hedefler.

## Ana Özellikler

- **Token Oluşturma:** Tarım yapılacak arazi ve tarlalar için arzı sınırlı Unique tokenler oluşturulabilir.
- **Gelir Dağıtımı:** Token sahiplerine sahip oldukları token yüzdesi kadar dönemsel/yıllık ROI gelir payı dağıtımı yapılabilir.
- **Şeffaflık ve İzlenebilirlik:** Tarımsal faaliyetlerin ve hesapların hareketi blok zincir üzerinde takip edilebilir.

## Akıllı Sözleşme Fonksiyonları

1. **initialize**  
   Akıllı sözleşmeyi başlatmak için kullanılır.  
   `function initialize(address _propertyManager, address initialOwner, uint256 _totalSupplyCap) public initializer;`

2. **mintTokens**  
   Yeni belirteçler oluşturmak için kullanılır.  
   `function mintTokens(address to, uint256 amount) public onlyOwner;`

3. **distributeRent**  
   Gelir dağıtımını gerçekleştirmek için kullanılır.  
   `function distributeRent() public payable;`

4. **receive**  
   Sözleşmeye ödeme yapmak için kullanılır.  
   `receive() external payable;`

## Gereksinimler

- Node.js
- Solidity

## Dağıtım Bilgileri

Akıllı sözleşme dağıtım adresi: [0x67EF874B655E62Fd27A555E78096348AD6254710](https://sepolia.scrollscan.com/address/0x67EF874B655E62Fd27A555E78096348AD6254710)

![image](https://github.com/user-attachments/assets/d68b2bf8-cd20-44f6-b98f-26bb8abfa2d0)
