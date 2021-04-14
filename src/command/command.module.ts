import { HttpModule } from '@nestjs/common';
import { Module } from '@nestjs/common';
import { ConsoleModule } from 'nestjs-console';
import { RedmineSeederService } from './redmineSeeder';
import { ConfigModule } from '@nestjs/config';

@Module({
  imports: [
    ConfigModule.forRoot(),
    HttpModule,
    ConsoleModule, // import the ConsoleModule
  ],
  providers: [RedmineSeederService],
  exports: [RedmineSeederService],
})
export class CommandModule {}
