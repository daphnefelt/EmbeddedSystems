#include "main.h"


void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 8;
  RCC_OscInitStruct.PLL.PLLN = 192;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV4;
  RCC_OscInitStruct.PLL.PLLQ = 8;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_3) != HAL_OK)
  {
    Error_Handler();
  }
}

#define RED 14
#define GREEN 12
#define BLUE 15

volatile int enableToggle = 1;

void setColor(char color){
	if (enableToggle == 1){
		if (color == 'r'){
			GPIOD->MODER = GPIOD->MODER | GPIO_MODER_MODER14_0;
			GPIOD->BSRR = GPIOD->BSRR | GPIO_BSRR_BS14_Msk;
		} else if (color == 'g'){
			GPIOD->MODER = GPIOD->MODER | GPIO_MODER_MODER12_0;
			GPIOD->BSRR = GPIOD->BSRR | GPIO_BSRR_BS12_Msk;
		} else if (color == 'b'){
			GPIOD->MODER = GPIOD->MODER | GPIO_MODER_MODER15_0;
			GPIOD->BSRR = GPIOD->BSRR | GPIO_BSRR_BS15_Msk;
		}
	}
}

void resetColor(char color){
	if (enableToggle == 1){
		if (color == 'r'){
			GPIOD->MODER = GPIOD->MODER | GPIO_MODER_MODER14_0;
			GPIOD->BSRR = GPIOD->BSRR | GPIO_BSRR_BR14_Msk;
		} else if (color == 'g'){
			GPIOD->MODER = GPIOD->MODER | GPIO_MODER_MODER12_0;
			GPIOD->BSRR = GPIOD->BSRR | GPIO_BSRR_BR12_Msk;
		} else if (color == 'b'){
			GPIOD->MODER = GPIOD->MODER | GPIO_MODER_MODER15_0;
			GPIOD->BSRR = GPIOD->BSRR | GPIO_BSRR_BR15_Msk;
		}
	}
}

int state = 0;
int done = 0;
char part = 'c';

void Toggle(void){
	state = ~state;

	if (state){
		resetColor('g');
		setColor('b');
	} else {
		resetColor('b');
		setColor('g');
	}
}

void EXTI0_IRQHandler(void){

	if (EXTI->PR & (1<<0)) {

		//Toggle();
		enableToggle = ~ enableToggle;

		EXTI->PR |= (1<<0);
	}
}

void TIM2_IRQHandler(void){

	if (TIM2->SR & (1<<0)) {

		state = ~ state;

		if (state){
			if (part == 'c'){
				resetColor('g');
				setColor('b');
			} else {
				setColor('r');
				GPIOD->BSRR |= GPIO_BSRR_BS1;  // PD1 HIGH
			}

		} else {
			if (part == 'c'){
				resetColor('b');
				setColor('g');
			} else {
				resetColor('r');
				GPIOD->BSRR |= GPIO_BSRR_BR1;  // PD1 LOW
			}
		}


		TIM2->SR &= ~(1<<0);
	}
}

int main(void)
{

	/* Configure the system clock */
	SystemClock_Config();

	// Clock Enables
	RCC->AHB1ENR = RCC->AHB1ENR | (1<<3); // Port D
	RCC->AHB1ENR = RCC->AHB1ENR | (1<<0); // Port A
	RCC->APB2ENR |= (1<<14); // Sys config clock
	RCC->APB1ENR |= (1<<0); // Enable Timer 2

	// Map PA0 -> EXTI0
	SYSCFG->EXTICR[0] &= ~(0xF << 0); // Clear bits
	SYSCFG->EXTICR[0] |= (0x0 << 0); // PA0 -> EXTI0

	// Config external interrupt
	EXTI->IMR |= (1<<0); // Unmask line 0
	EXTI->RTSR |= (1<<0); // Rising edge trigger
	EXTI->FTSR &= ~(1<<0); // Disable falling edge

	// Config Timer 2
	TIM2->PSC = 15999;
	TIM2->ARR = 660;
	if (part == 'c'){
		TIM2->ARR = 2000; // go slower here
	}
	TIM2->EGR |= (1<<0);
	TIM2->DIER |= (1<<0);
	TIM2->CR1 |= (1<<0);

	GPIOD->MODER |= GPIO_MODER_MODER1_0;  // PD1 = General purpose output
	GPIOD->MODER &= ~GPIO_MODER_MODER1_1; // Ensure it's not set as alternate function

	setColor('g');

	// Enable Interrupt in VNIC
	if (part == 'c'){
		NVIC_EnableIRQ(EXTI0_IRQn);
	}
	NVIC_EnableIRQ(TIM2_IRQn);

	/* USER CODE BEGIN WHILE */
	while (1)
	{

	}

}


