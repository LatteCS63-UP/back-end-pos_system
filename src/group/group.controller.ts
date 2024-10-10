import { Controller, Get, Query } from '@nestjs/common';
import { GroupService } from './group.service';
import { ApiTags } from '@nestjs/swagger';

@Controller('group')
@ApiTags('Group')
export class GroupController {
    constructor(private readonly group_service: GroupService) {}

    //* Address
    @Get('Province-District-SubDistrict')
    async select_city(
        @Query('ProvinceID') ProvinceID?: number,
        @Query('DistrictID') DistrictID?: number

    ): Promise<any> {
        if(ProvinceID != null) {
            const result = await this.group_service.show_district(ProvinceID)
            return result

        }else if(DistrictID != null) {
            const result = await this.group_service.show_subdistrict(DistrictID)
            return result

        }else {
            const result = await this.group_service.show_province()
            return result

        }
    }

    //* Job-title
    @Get('Job-title')
    async select_job_title(): Promise<any> {
        const result = await this.group_service.show_job_title()
        return result
    }
}
