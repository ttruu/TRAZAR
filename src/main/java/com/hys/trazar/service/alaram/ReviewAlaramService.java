package com.hys.trazar.service.alaram;

import org.springframework.stereotype.Component;

import com.hys.trazar.domain.alaram.AlaramDto;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ReviewAlaramService implements AlaramService  {



    @Override
    public void alarm(AlaramDto infoDto) {
        log.info("{} 에게 문자메시지 전송 = {}", infoDto.getTarget().getNickName(), infoDto.getMessage());
    }

}
