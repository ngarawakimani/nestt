import { Module, HttpModule } from '@nestjs/common';
import { TimeEntriesController } from './time-entries.controller';
import { TimeEntriesService } from './time-entries.service';
import { ConfigModule } from '@nestjs/config';
import { ConfigService } from '@nestjs/config';
import { Helpers } from './../shared/helpers';

@Module({
  imports: [
    ConfigModule.forRoot(),
    HttpModule.registerAsync({
      imports: [ConfigModule],
      useFactory: async (configService: ConfigService) => ({
        baseURL: configService.get('REDMINE_API_URL'),
        headers: {
          'X-Redmine-API-Key': configService.get('REDMINE_KEY'),
        },
      }),
      inject: [ConfigService],
    }),
  ],
  controllers: [TimeEntriesController],
  providers: [TimeEntriesService, Helpers],
})
export class TimeEntriesModule {}
