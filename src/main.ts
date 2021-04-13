import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';

async function bootstrap() {
  const appOptions = { cors: true };
  const app = await NestFactory.create(AppModule, appOptions);
  app.setGlobalPrefix('api/v1');
  const options = new DocumentBuilder()
    .setTitle('Time Entries Redmine API')
    .setDescription('A REST API to allow for time entries by users')
    .setVersion('1.0')
    .setBasePath('api/v1')
    .addBearerAuth()
    .build();
  const document = SwaggerModule.createDocument(app, options);
  SwaggerModule.setup('/docs', app, document);
  await app.listen(3030);
}
bootstrap();
