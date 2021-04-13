import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConsoleModule } from 'nestjs-console';
import { TimeEntriesModule } from './time-entries/time-entries.module';

@Module({
  imports: [ConsoleModule, TimeEntriesModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
