import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
// import { BootstrapConsole } from 'nestjs-console';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  // app.use(BootstrapConsole);
  await app.listen(3030);
}
bootstrap();
