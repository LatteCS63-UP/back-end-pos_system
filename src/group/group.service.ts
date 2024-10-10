import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma.service';
import { MasDistrict, MasJobTitle, MasProvince, MasSubDistrict } from './model/group.model';

@Injectable()
export class GroupService {
    constructor(private prisma: PrismaService) {}

    //* Address
    async show_province(): Promise<MasProvince[]> {
        return await this.prisma.masProvince.findMany({
            select: {
                ProvinceID: true,
                ProvinceNameTh: true,
            },
            orderBy: {
                ProvinceNameTh: 'asc'
            }
        })
    }

    async show_district(ProvinceID?: number): Promise<MasDistrict[]> {
        return await this.prisma.masDistrict.findMany({
            where: {ProvinceID: +ProvinceID},
            select: {
                DistrictID: true,
                DistrictNameTh: true,

                ProvinceID: true,
            },
            orderBy: {
                DistrictNameTh: 'asc',
            }
        })
    }

    async show_subdistrict(DistrictID?: number): Promise<MasSubDistrict[]> {
        return await this.prisma.masSubDistrict.findMany({
            where: {DistrictID: +DistrictID},
            select: {
                SubDistrictID: true,
                SubDistrictNameTh: true,
                
                DistrictID: true
            },
            orderBy: {
                SubDistrictNameTh: 'asc'
            }
        })
    }

    //* Job-title
    async show_job_title(): Promise<MasJobTitle[]> {
        return await this.prisma.masJobTitle.findMany({
            select: {
                JobTitleID: true,
                JobTitleName: true
            }
        })
    }
}
