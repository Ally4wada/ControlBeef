// Definição da entrada analogica como A0.
const int PINO_SENSOR_TEMPERATURA = A2; 

// Definição da variavel como float para capturar o valor da temperatura, onde o valor tem casas depois da virgula.
float temperaturaCelsius;

// Definição da variavel como int para definir o valor máximo e mínimo da temperatura.
int tempMax = 4;
int tempMin = -3;

// Função para iniciação do programa.
void setup(){
  
  // Inicia a porta serial com taxa de transmissão em bits por segundo em 9600.
  Serial.begin(9600);
  
}

// Função para rodar o programa e nunca parar.
void loop(){
  
  // Variavel para ler o valor analogico que esta sendo passado pelo sensor na porta analogica.
  int valorLeitura = analogRead(PINO_SENSOR_TEMPERATURA);
  
  // Calculo para converter o valor capturado pelo sensor em graus celsius.
  temperaturaCelsius = (valorLeitura * 5.0 / 1023.0) / 0.01 - 25;
  
  // O seriais são para formar a mensagem "Temperatura: (temperaturaCelsius), Maxima: (tempMax), Minima: (tempMin)"
  Serial.print("Temperatura:"); 
  Serial.print(temperaturaCelsius);
  Serial.print(",");

  Serial.print("Maxima:");
  Serial.print(tempMax);
  Serial.print(",");
  
  Serial.print("Minima:");
  Serial.println(tempMin);

  // Delay para o loop capturar os dados de 2 em 2 segundos. Muda de acordo com valor dentro do parêntese que esta em ms(milissegundos).
  delay(2000);
}

